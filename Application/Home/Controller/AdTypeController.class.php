<?php
namespace Home\Controller;

class  AdTypeController extends CrudController
{
    public function _add()
    {
        $_POST['name'] = "云岩区";
        $_POST['identifier'] = "YYQ";

        if (1) {
            # 新增数据唯一性判断
            $where = ['name' => $_POST['name']];
            if ($this->exists($where)) {
                $this->ajaxReturn(['status' => -2, 'msg' =>'名称已经存在'], "JSON");
            }

        } else {
            # 渲染界面时获取相关数据
        }
    }
}