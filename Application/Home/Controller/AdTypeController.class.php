<?php
namespace Home\Controller;

use Org\Util\UI;
use Org\Util\Filter;

class  AdTypeController extends CrudController
{
    public function __construct()
    {
        parent::__construct();
        layout(false);
        $this->assign('layUI',   UI::get());
    }
    public function index()
    {
        layout(true);
        $this->assign('layUI',   UI::get());
        $this->display();
    }
    public function _add()
    {
        if (IS_AJAX) {
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