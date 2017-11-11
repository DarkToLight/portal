<?php
namespace Home\Controller;

class ApController extends CrudController
{
    public function _add()
    {
        if (1) {
            $_POST = [
                'name' => 'Tp-link250',
                'status' => 1,
                'create_time' =>date("Y-m-d H:i:s"),
                'ad_num' => 0,
                'ap_area_id' => 1,
                'mac' => "aa:bb:cc:df",
                'address' => '关山湖区',
            ];
            # 数据检查

            # 数据唯一性判断
            $where = ['name' => $_POST['name'], 'mac' => $_POST['mac'], ['_logic'] => 'OR'];
            if ($this->exists($where)) {
                $this->ajaxReturn(['status' => -2, 'msg' =>'mac和地址都要唯一'], "JSON");
            }
        } else {

        }
    }
}