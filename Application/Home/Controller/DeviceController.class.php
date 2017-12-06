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
        $mac = preg_replace("/[:_]*/", '', $mac);

        $clientIp = get_client_ip();

        $mAp = M("ap");
        $apWhere['mac'] = array('like', $mac . '%');
        $apInfo = $mAp->where($apWhere)->find();

        $adPosition = M('ad_position')->where("is_del = 0")->select();
        $adPosition = array_column($adPosition, 'id', 'identifier');

        $_auth = $this->getAd($date, $time, $apInfo, $adPosition['REN_ZHENG']);
        $au_th = $this->getAd($date, $time, $apInfo, $adPosition['DENG_LU']);

        $this->assign('client_ip',$clientIp);
        $this->assign('adpath',$_auth['resource']);
        $this->assign('au_th',$au_th['resource']);
        $this->display();
    }
    public function getAd($date, $time, $apInfo, $adPosition)
    {
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
            $adWhere['ad_position_id'] = $adPosition;
            $adInfo = $mAd->where($adWhere)->select();
            # 曝光时间判断
            foreach ($adInfo as $k => $info) {
                $isIn = false;
                $exposureTime = json_decode($info['exposure_time'], true);
                if (is_array($exposureTime)) {
                    foreach ($exposureTime as $times) {
                        if ($time >  $times['start_time'] && $time < $times['over_time']) {
                            $isIn = true;
                            break;
                        }
                    }
                    if (!$isIn) { # 如果广告不在投放时段，删除之
                        unset($adInfo[$k]);
                    }
                }
            }
        }
        if(empty($adInfo)) {
            $adWhere = ['is_default' => 1, "ad_position_id" => $adPosition]; # 当前时间没有广告投放
            $adInfo = $mAd->where($adWhere)->select();
        }
        return $this->weightChoose($adInfo); # 一个区域根据权重来随机展示广告
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
    public function apInArea()
    {
        $ap = M('ap');
        $online = $ap->select();
        foreach ($online as $k => &$v) {
            preg_match("/[a-zA-Z]*[1-9]{0,1}/", $v['name'], $match);
            switch (strtolower($match[0])) {
                case "gsh" :
                    break;
                    $gsh['x'] = "观山湖区";
                    $ap->where(['id' => $v['id']])->save(['ap_area_id' => 146]);
                    break;
                case "gsh1" :
                    $gsh['x'] = "会展城";
                    $ap->where(['id' => $v['id']])->save(['ap_area_id' => 159]);
                    break;
                case "by" :
                    break;
                    $by['x'] = "白云区";
                    $ap->where(['id' => $v['id']])->save(['ap_area_id' => 138]);
                    break;
                case "yy" :
                    break;
                    $ap->where(['id' => $v['id']])->save(['ap_area_id' => 154]);
                    $yy['x'] = "云岩区";
                    break;
                case "nm" :
                    break;
                    $ap->where(['id' => $v['id']])->save(['ap_area_id' => 150]);
                    $nm['x'] = "南明区";
                    break;
                case "hx" :
                    break;
                    $ap->where(['id' => $v['id']])->save(['ap_area_id' => 149]);
                    $hx['x'] = "花溪区";
                    break;
                case "gxq" :
                    break;
                    $ap->where(['id' => $v['id']])->save(['ap_area_id' => 145]);
                    $hx['x'] = "高新区";
                    break;
                case "hx1" :
                    break;
                    $ap->where(['id' => $v['id']])->save(['ap_area_id' => 156]);
                    $hx['x'] = "花溪党校";
                    break;
                case "nm1" :
                    break;
                    $ap->where(['id' => $v['id']])->save(['ap_area_id' => 157]);
                    $hx['x'] = "中华路";
                    break;
                case "xh" :
                    break;
                    $ap->where(['id' => $v['id']])->save(['ap_area_id' => 153]);
                    $hx['x'] = "小河区";
                    break;
                case "by1" :
                    break;
                    $ap->where(['id' => $v['id']])->save(['ap_area_id' => 158]);
                    $hx['x'] = "泉胡公园";
                    break;
            }
        }
    }
}
