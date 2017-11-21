<?php
namespace Home\Controller;

class AdController extends CrudController
{
    public function _add()
    {
        if (IS_AJAX) {
            # 新增数据唯一性判断

        } else {
           # 渲染界面时获取相关数据
        }
    }
    public function index()
    {
        layout(false);
        $this->display("All/ManageAD/orderAD");
    }
}