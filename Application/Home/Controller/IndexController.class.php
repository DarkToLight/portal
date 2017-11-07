<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
	
    public function index()
    {
		$this->redirect('index/login');

	}

    public function login($status = '1')
    {
		layout(false);
		switch ($status) {
            
            case '1':
                $this->assign('result', '');
                break;
            case '2':
                $this->assign('result', '<span>*</span>用户名或密码为空');
				$this->assign('block', 'block');
                break;
            case '3':
                $this->assign('result', '<span>*</span>用户名或密码错误');
                $this->assign('block', 'block');
				break;
            case '4':
                $this->assign('result', '<span>*</span>请重新登录');
				$this->assign('block', 'block');
                break;
            case '5':
                $this->assign('result', '<span>*</span>您无此权限');
				$this->assign('block', 'block');
                break;
            case '6':
                $this->assign('result', '<span>*</span>验证码错误');
				$this->assign('block', 'block');
                break;
			case '7':
                $this->assign('result', '<span>*</span>网站问题请联系管理员');
				$this->assign('block', 'block');
                break;
        }
        $this->display();
    }

    public function postLogin()
    {
        $username = I('post.username','');
        $password = I('post.password','');
		
		
        if ($password == '' or $username == '') {
            $this->redirect('index/login', 'status=2');
        } else {
            $User = M("user");
            $condition['username'] = $username;
            $condition['password'] = md5($password);
            $user = $User->where($condition)->select();
            if (count($user) == 1) {
                $user_name = $user[0]['username'];
                $user_level = $user[0]['level'];
                session('username', $user_name);
                session('level', $user_level);
				switch(session('level')){					
					case 0:
						session('level', '超级管理员');	
						$this->redirect('Dashboard/dashboard');
					break;
				}
            } else {
				$this->redirect('index/login', 'status=3');
            }
        }


    }
    public function resetLogin()
    {	
		layout(false);
        if (! session('user_name', null)) {           
            $this->redirect('index/login');
        }
    }
	
	
}