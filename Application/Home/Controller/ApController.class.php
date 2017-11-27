<?php
namespace Home\Controller;

use Org\Util\Filter;
use Org\Util\Tree;
use Org\Util\UI;

class ApController extends CrudController
{
    public function __construct()
    {
        parent::__construct();
        layout(false);
        $this->assign('layUI',   UI::get());
    }
    public function _add()
    {
        if (IS_AJAX) {
            $_POST['create_time'] = date("Y-m-d H:i:s");
            try{
                # 数据检查
                $must = ['name', 'ap_area_id', 'mac', 'longitude' =>  0, 'latitude' => 0];
                list($name, $ap_area_id, $mac) = Filter::notEmpty($must);

                # 数据唯一性判断
                $where = ['name' => $_POST['name'], 'mac' => $_POST['mac'], ['_logic'] => 'OR'];
                if ($this->exists($where)) {
                    throw new \Exception("mac地址和AP名称都要唯一");
                }
            } catch(\Exception $e) {
                $this->ajaxReturn(['status' => -1, 'msg' => $e->getMessage()]);
            }
        } else {
            $area = D("area");
            $this->assign("area", Tree::tree($area->where(['is_del' => 0])->select(), 0));
        }
    }
    public function index()
    {
        layout(false);
        $this->assign('layUI',   UI::get());
        $this->display();
    }
    public function _edit()
    {
        try {
            if (IS_AJAX) {
                # 数据检查
                $must = ['name', 'ap_area_id', 'mac', 'longitude' => 0, 'latitude' => 0];
                Filter::notEmpty($must);
            }
            $area = D("area");
            $this->assign("area", Tree::tree($area->where(['is_del' => 0])->select(), 0));
        }catch (\Exception $e) {
            $this->ajaxReturn(['status' => -1, 'msg' => $e->getMessage()]);
        }
    }
    public function lists_(&$back)
    {
        #获取Ap所在区域名称
        $area = M("area");
        $where['is_del'] = 0;
        $areaTree = Tree::tree($area->where($where)->select(), 0);
        $areaTree = array_column($areaTree, 'name', 'id');

        # 状态对应的值
        foreach ($back->data as $key => &$val) {
            $val['ap_area_id'] = $areaTree[$val['ap_area_id']]; # 设置AP区域名称的值
            switch ($val['status']){
                case "1":
                    $val['status'] = "正常";
                    break;
                case "-1":
                    $val['status'] = "异常";
                    break;
                case "-2":
                    $val['status'] = "维修中";
                    break;
            }
        }
    }
}