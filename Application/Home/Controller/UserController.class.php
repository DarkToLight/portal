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

class UserController extends CrudController
{
    public function login()
    {
        error_reporting("warring");
        if (1) {
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
    public function _edit()
    {
        $_POST['name'] = '更新测试';
        $_POST['id']  = 2;
    }
}