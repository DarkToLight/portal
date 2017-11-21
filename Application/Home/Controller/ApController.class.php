<?php
namespace Home\Controller;

use Org\Util\Filter;
use Org\Util\UnlimitedClassification;

class ApController extends CrudController
{
    public function _add()
    {
        if (IS_AJAX) {
            $_POST = [
                'name' => 'edfdf',
                'status' => 1,
                'create_time' =>date("Y-m-d H:i:s"),
                'ad_num' => 0,
                'ap_area_id' => 1,
                'mac' => "aa:bb:cc:df",
                'address' => '关山湖区',
            ];
            try{
                # 数据检查
                $must = ['name', 'ap_area_id' => 0, 'mac'];
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
            $this->ajaxReturn(UnlimitedClassification::recursion($area->select(), 0));
            exit;
        }
    }
}