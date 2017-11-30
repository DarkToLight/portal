<?php
/*
 +----------------------------------------
 |Auth:<dark2light@qq.com>
 +----------------------------------------
 |main:区域表数据管理
 +----------------------------------------
*/
namespace Home\Controller;

use Org\Util\Filter;
use Org\Util\UI;

class UserController extends CrudController
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
        $this->display();
    }
    public function _add() {
        if (IS_AJAX) {
            $_POST['addtime'] = date("Y-m-d H:i:s");
            try {
                $must = ['username', 'password'];
                list($userName, $password) = Filter::notEmpty($must);
                $_POST['password'] = md5($password);

                # 数据唯一性判断
                $where = ['username' =>$userName, 'is_del' => 0];
                if ($this->exists($where)) {
                    throw new \Exception("用户名已存在！");
                }
            } catch (\Exception $e) {
                $this->ajaxReturn(['status' => -1, 'msg' => $e->getMessage()]);
            }
        }
    }
}