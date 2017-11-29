<?php
namespace Home\Controller;

use think\Controller;

class DeviceController  extends Controller
{

    public function login()
    {
        layout(false);
        $time = date("H:i:s");
        $date = date("Y-m-d");

        $mac = isset($_GET['AP-MAC'])?trim($_GET['AP-MAC']):'00:00:00:00:00:00';
        $clientIp = get_client_ip();

        $mAp = M("ap");
        $apInfo = $mAp->where("mac='{$mac}'")->find();

        $mArea = M('area');
        $areaInfo = $mArea->where("id='{$apInfo['ap_area_id']}'")->find();

        $mAreaAd = M('area_ad');
        $areaAdList = $mAreaAd->where("area_id = '{$areaInfo['id']}'")->select();

        $mAd = M("ad");
        if (!empty($areaAdList)) {
            # 筛选出当前AP，当前时间段的AD
            $adWhere['id'] = ['in', array_column($areaAdList, 'ad_id')];
            $adWhere['start_time'] = array("ELT", $date);
            $adWhere['over_time'] = array("EGT", $date);
            $adInfo = $mAd->where($adWhere)->select();
            # 曝光时间判断
            foreach ($adInfo as $k => $info) {
                $isIn = false;
                foreach (json_decode($info['exposure_time'], true) as $times) {
                    if ($time >  $times['start_time'] && $time < $times['over_time']) {
                        $isIn = true;
                        break;
                    }
                }
                if (!$isIn) { # 如果广告不在投放时段，删除之
                    unset($adInfo[$k]);
                }
            }
            if(empty($adInfo)) {
                $adWhere = ['is_default' => 1]; # 当前时间没有广告投放
                $adInfo = $mAd->where($adWhere)->select();
            }
        } else {
            $adWhere = ['is_default' => 1]; # 没有就放默认广告
            $adInfo = $mAd->where($adWhere)->select();
        }
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
