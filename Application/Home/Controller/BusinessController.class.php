<?php
/*
 +----------------------------------------
 |Auth:<dark2light@qq.com>
 +----------------------------------------
 |main:广告商管理
 +----------------------------------------
*/
namespace Home\Controller;

use Org\Util\Filter;
use Org\Util\Tree;
use Org\Util\UI;

class BusinessController extends CrudController
{
    public function __construct()
    {
        parent::__construct();
        layout(false);
        $this->assign('layUI',   UI::get());
    }
    public function _add()
    {
        if (IS_AJAX) {
            # 新增数据唯一性判断
            $_POST['create_time'] = date("Y-m-d H:i:s");
            $must = ['name'];
            Filter::notEmpty($must);
            $where = ['name' => $_POST['name'], 'is_del' => 0];

            if ($this->exists($where)) {
                $this->ajaxReturn(['status' => -2, 'msg' =>'名称不能重复'], "JSON");
            }

        }
    }
}