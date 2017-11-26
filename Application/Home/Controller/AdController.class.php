<?php
namespace Home\Controller;

use Org\Util\Filter;
use Org\Util\Tree;
use Org\Util\UI;

class AdController extends CrudController
{
    public function __construct()
    {
        parent::__construct();
        layout(false);
        $this->assign('layUI',   UI::get());
    }
    public function _add()
    {
        $where['is_del'] = 0;
        $apPosition = D('ad_position');
        $business = D('business');
        $adType = M('ad_type');
        $area = M('area');
        if (IS_AJAX) {
            try{
               // $_POST['start_time'] = substr($_POST['time'], 0, 10);
                //$_POST['over_time'] = substr($_POST['time'], -1, 10);

              //  $must = ['name', 'start_time', 'over_time', 'ad_area_id', 'ad_type_id', 'ad_position_id', 'weight' => 1];
              //  Filter::notEmpty($must);
            } catch (\Exception  $e) {
                $this->ajaxReturn(['status' => -1, 'msg' => $e->getMessage()]);
            }
        } else {
           # 渲染界面时获取相关数据

            $this->assign('area', Tree::tree($area->where($where)->select()));
            $this->assign('adPosition', $apPosition->where($where)->select());
            $this->assign('business', $business->where($where)->select());
            $this->assign('adType', $adType->where($where)->select());
        }
    }
    public function add_($id)
    {
        $data['ad_id'] = $id;
        $data['area_id'] = $_POST['area_id'];
        $mAreaAd = M("area_ad");
        $mAreaAd->add($data);
        echo $mAreaAd->getLastSql();
    }
    public function index()
    {
        $this->assign('layUI',   UI::get());
        $this->display();
    }
    public function show()
    {
        $this->assign('layUI',   UI::get());
        $this->display();
    }
}