<?php
namespace Home\Controller;

use Org\Util\Tree;
use Org\Util\UI;
use Org\Util\Filter;

class AdController extends CrudController
{
    public function __construct()
    {
        parent::__construct();
        layout(false);
        $this->assign('layUI',   UI::get());
    }
    public function index()
    {
        layout(true);
        $where['is_del'] = 0;

        $business = D('business');

        $area = M('area');
        # 渲染界面时获取相关数据
        $areaTree = Tree::tree($area->where($where)->select());
        $this->assign('area', $areaTree);

        $this->assign('business', $business->where($where)->select());
        $this->assign('checkedBusiness', $_REQUEST['business_id']);
        $this->display();
    }
    public function _add()
    {
        layout(true);
        $where['is_del'] = 0;
        $apPosition = D('ad_position');
        $business = D('business');
        $adType = M('ad_type');
        $area = M('area');
        if (IS_AJAX) {
            try{
                $_POST['create_time'] = date("Y-m-d H:i:s");
                $_POST['start_time'] = substr($_POST['daytime'], 0, 10);
                $_POST['weight'] =abs($_POST['weight']);
                $_POST['over_time'] = substr($_POST['daytime'], -10, 10);
                foreach ($_POST['checkedTimeStart'] as $key => $val) {
                    $exposureTime[] = array('start_time' => $val, 'over_time' => $_POST['checkedTimeEnd'][$key]);
                }
                $_POST['exposure_time'] = json_encode($exposureTime);
                $must = ['name', 'start_time', 'over_time', 'area_id', 'ad_type_id', 'ad_position_id', 'weight' => 1];
                Filter::notEmpty($must);
            } catch (\Exception  $e) {
                $this->ajaxReturn(['status' => -1, 'msg' => $e->getMessage()]);
            }
        } else {
           # 渲染界面时获取相关数据
            $this->assign('area', Tree::tree($area->where($where)->select()));
            $this->assign('adPosition', $apPosition->where($where)->select());
            $this->assign('business', $business->where($where)->select());
            $this->assign('checkedBusiness', $_REQUEST['business_id']);
            $this->assign('adType', $adType->where($where)->select());
        }
    }
    public function add_($id)
    {
        # 循环增加投放区域
        $data['ad_id'] = $id;
        $arrAreaId = explode(',', $_REQUEST['area_id']);
        $mAreaAd = M("area_ad");
        foreach ($arrAreaId as $key => $val) {
            if (!empty($val)) {
                $data['area_id'] = $val;
                $mAreaAd->add($data);
            }
            continue;
        }

    }
    public function _edit() {
        layout(true);
        # 渲染界面时获取相关数据

        $where['is_del'] = 0;
        $apPosition = D('ad_position');
        $business = D('business');
        $adType = M('ad_type');
        //$area = M('area');
        //$this->assign('area', Tree::tree($area->where($where)->select()));

        $this->assign('adPosition', $apPosition->where($where)->select());
        $this->assign('business', $business->where($where)->select());
        $this->assign('adType', $adType->where($where)->select());
    }
    # 数据edit进行处理
    public function edit_(&$data)
    {
        # 取出广告投放区域
        $adArea = M('area_ad');
        $adAreaWhere = ['is_del' => 0, 'ad_id' => $data['id']];
        $adAreaList = $adArea->where($adAreaWhere)->select();

        $area = M('area');
        $areaList = $area->where('is_del=0')->select();
        $areaList = array_column($areaList, 'name', 'id');

        foreach($adAreaList as $area) {
            $data['area_ad'][] = $areaList[$area['area_id']];
        }

        $this->assign("area_ad",$data['area_ad']);
        $this->assign("exposure_time",json_decode($data['exposure_time'], true));
    }
    # 保存数据之前进行处理
    public function _saveEdit()
    {
        $id = (int)$_REQUEST['id'];
        $_POST['start_time'] = substr($_POST['daytime'], 0, 10);
        $_POST['over_time'] = substr($_POST['daytime'], -10, 10);
        $_POST['weight'] =abs($_POST['weight']);
        foreach ($_POST['checkedTimeStart'] as $key => $val) {
            $exposureTime[] = array('start_time' => $val, 'over_time' => $_POST['checkedTimeEnd'][$key]);
        }
        $_POST['exposure_time'] = json_encode($exposureTime);

        # 删除投放区域
        $areaAd = M("area_ad");
        $areaAd->where("ad_id = {$id}")->delete();
        # 重新添加投放区域
        $this->add_($id);

    }
    public function _del()
    {
        # 删除广告之前，先删除广告投放区域
        $areaAd = M("area_ad");
        $id = (int)$_REQUEST['id'];
        $areaAd->where("ad_id={$id}")->delete();
    }

    public function _lists(&$where)
    {
        $area = $_REQUEST['area_id'];
        if (!empty($area)) {
            $adWhere['is_del'] = 0;
            $adWhere['area_id'] = $area;
            $areaAd = array_column(M("area_ad")->where($adWhere)->field("ad_id")->select(), 'ad_id');
            if (!empty($areaAd)) {
                $where['id'] = array('in', $areaAd);
            }else {
                $where['id'] = '';
            }
        }

        $business = $_REQUEST['business_id'];
        if (!empty($business)) {
            $where['business_id'] = $business;
        }
        $name = $_REQUEST['name'];
        if (!empty($name)) {
            $where['name'] = array('like', '%' . $name . '%');
        }
        $area = M('area');
        $this->assign('area', $area->where('is_del=0')->select());
    }

    public function lists_(&$backData)
    {
        # 获取投放区域的名称
        $area = M("area");
        $where['is_del'] = 0;
        $areaTree = Tree::tree($area->where($where)->select(), 0);
        $areaTree = array_column($areaTree, 'name', 'id');
        # 获取广告商名称
       $business = M("business");
       $areaAd = M("area_ad");
       $businessList = $business->where("is_del = 0")->field("id, name")->select();
       $businessList = array_column($businessList, 'name', 'id');

       # 获取广告位名称
        $adPosition = M("ad_position");
        $adPositionList = $adPosition->where("is_del = 0")->field("id, name")->select();
        $adPositionList = array_column($adPositionList, 'name', 'id');

        # 获取广告类型名称
        $adType = M("ad_type");
        $adTypeList = $adType->where("is_del = 0")->field("id, name")->select();
        $adTypeList = array_column($adTypeList, 'name', 'id');

       foreach ($backData->data as $key => &$val) {
           $val['business_id'] = $businessList[$val['business_id']];
           $val['ad_position_id'] =  $adPositionList[$val['ad_position_id']];
           $val['ad_type_id'] =  $adTypeList[$val['ad_type_id']];
           $val['start_time_over_time'] = $val['start_time'] . "至" .$val['over_time'];
           $exposureTime = json_decode($val['exposure_time']);
           if (is_array($exposureTime)) {
               $val['exposure_time'] = '';
               foreach ($exposureTime as $key2 => $val2){
                   $val['exposure_time'] .= $val2->start_time . "至" . $val2->over_time . str_repeat("&nbsp;", 6);
               }
           } else{
               $val['exposure_time'] = "全时段";
           }
           # 获取广告投放区域
           $where = ['is_del' => 0, 'ad_id' => $val['id']];
           $adArea = $areaAd->where($where)->select();
           foreach ($adArea as $key1 => $val1) {
               $val['ad_area'] .= $areaTree[$val1['area_id']] . "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
           }
       }
    }
}