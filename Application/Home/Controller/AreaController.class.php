<?php
/*
 +----------------------------------------
 |Auth:<dark2light@qq.com>
 +----------------------------------------
 |main:区域表数据管理
 +----------------------------------------
*/
namespace Home\Controller;

class AreaController extends CrudController
{
    public function _add()
    {
        $_POST['name'] = "云岩区";
        $_POST['parent_id'] = "1";
        $_POST['create_time'] = date("Y-m-d H:i:s");

        if (1) {
            # 数据唯一性判断
            $where = ['name' => $_POST['name'], 'parent_id' => $_POST['parent_id'], "_logic" => "AND"];
            if ($this->exists($where)) {
                $this->ajaxReturn(['status' => -2, 'msg' =>'名称已经存在'], "JSON");
            }
        } else {
            $this->assign('a','1');
        }
    }
    public function _edit()
    {
        $_POST['name'] = '更新测试';
        $_POST['id']  = 2;
    }
}