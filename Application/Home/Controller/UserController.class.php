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

    /*用户设置*/
    public function index(){
        layout(false);
        $this->display();
    }
    public function myloginfo(){
        layout(false);
        $this->display();
    }
    public function changepwd(){
        layout(false);
        //$this->display("changepwd");
        $this->display();
    }
    public function personInfo(){
        layout(false);
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
    public function login()
    {
        if (IS_AJAX) {
            $_POST['name'] = "admin";
            $_POST['password'] = "admin";
            try{
                $must = ['name', 'password'];
                list($name, $password) = Filter::notEmpty($must);

                # 数据唯一性判断
                $where = ['name' => $name, 'password' => md5($password)];
                if ($userInfo = $this->exists($where)) {
                   session("userInfo", $userInfo);
                    $this->ajaxReturn(['status' => 1, 'msg' => "登录成功"]);
                } else {
                    throw new  \Exception("用户名或者密码错误");
                }
            }catch (\Exception $e) {
                $this->ajaxReturn(['status' => -1, 'msg' => $e->getMessage()]);
            }
        } else {

        }
    }
}