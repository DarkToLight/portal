<?php
namespace Home\Controller;

use think\Controller;

class DeviceController  extends Controller
{

    public function login()
    {
        layout(false);

        $mac = isset($_GET['AP-MAC'])?trim($_GET['AP-MAC']):'00:00:00:00:00:00';
        $clientIp = get_client_ip();

        $mAp = M("ap");
        $apInfo = $mAp->where("mac='{$mac}'")->find();

        $mArea = M('area');
        $areaInfo = $mArea->where("id='{$apInfo['ap_area_id']}'")->find();

        $mAreaAd = M('area_ad');
        $areaAdList = $mAreaAd->where("area_id = '{$areaInfo['id']}'")->select();

        if (!empty($areaAdList)) {
            $adWhere['id'] = ['in', array_column($areaAdList, 'ad_id')];
        } else {
            $adWhere = ['is_default' => 1]; # 没有就放默认广告
        }
        $mAd = M("ad");
        $adInfo = $mAd->where($adWhere)->select();
        $adInfo = $this->weightChoose($adInfo); # 一个区域根据权重来随机展示广告

        $this->assign('client_ip',$clientIp);
        $this->assign('adpath',$adInfo['resource']);
        $this->display();
    }
    # 根据权重随机选择数组中的一个
    private function weightChoose($array)
    {
        $weight = 0;
        $tmp = array();
        foreach ($array as $val) {
            $weight += $val['weight'];
            for ($i = 0; $i < $val['weight']; $i ++) {
                $tmp[] = $val;
            }
        }
        $use = rand(0, $weight-1);
        return $tmp[$use];
    }
}
