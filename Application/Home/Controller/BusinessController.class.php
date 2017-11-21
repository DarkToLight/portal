<?php
/*
 +----------------------------------------
 |Auth:<dark2light@qq.com>
 +----------------------------------------
 |main:广告商管理
 +----------------------------------------
*/
namespace Home\Controller;

class BusinessController extends CrudController
{
    public function _add()
    {
        if (IS_AJAX) {
            # 新增数据唯一性判断
            $_POST['create_time'] = date("Y-m-d H:i:s");

            $where = ['name' => $_POST['name'], 'is_del' => 0];
            if ($this->exists($where)) {
                $this->ajaxReturn(['status' => -2, 'msg' =>'名称不能重复'], "JSON");
            }

        } else {
            # 渲染界面时获取相关数据
        }
    }
}