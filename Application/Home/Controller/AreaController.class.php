<?php
/*
 +----------------------------------------
 |Auth:<dark2light@qq.com>
 +----------------------------------------
 |main:区域表数据管理
 +----------------------------------------
*/
namespace Home\Controller;

use Org\Util\Filter;
use Org\Util\Tree;
use Org\Util\UI;


class AreaController extends CrudController
{
    public function __construct()
    {
        parent::__construct();
        layout(false);
        $this->assign('layUI',   UI::get());
    }
    public function index()
    {
        $area = D("area");
        $areaTree = Tree::tree($area->where(['is_del' => 0])->select());
        $this->assign('area', $areaTree);
        $this->assign('layUI',   UI::get());
        $this->display();
    }
    public function main(){
        $this->display("FyrzAD/main");
    }
    public function _add()
    {
        if (IS_AJAX) {
            $_POST['create_time'] = date("Y-m-d H:i:s");
            try{
               $must = ['name', 'parent_id' => 0];
               list($name, $parent_id) = Filter::notEmpty($must);
                # 上级分类存在判断
                $mArea = D('area');
                if(!$mArea->exists(['id' => $parent_id, 'is_del' => 0])) {
                    throw new \Exception("上级分类不存在！");
                }

                # 数据唯一性判断
                $where = ['name' => $name, 'parent_id' => $parent_id, 'is_del' => 0];
                if ($this->exists($where)) {
                    throw new \Exception("不能添加重复的区域或场景！");
                }
            }catch (\Exception $e) {
               $this->ajaxReturn(['status' => -1, 'msg' => $e->getMessage()]);
            }
        }
    }
    public function lists_(&$backData)
    {
        $areaTree = Tree::tree($backData->data);
        $backData->data = $areaTree;
    }
    public function _del($id)
    {
        # 删除之前检查关联
        try {
            $mAp = M("ap");
            $exists = $mAp->where(['ap_area_id' => $id, 'is_del' => 0])->find();
            if (!empty($exists)) {
                throw new \Exception("场景或者区域下有AP设备，不能删除！");
            }

            if ($this->exists(['parent_id' => $id, 'is_del' => 0])) {
                throw new \Exception("此分类存在下级分类，不能删除");
            }
        } catch (\Exception $e) {
            $this->ajaxReturn(['status' => -1, 'msg' => $e->getMessage()]);
        }
    }
}
