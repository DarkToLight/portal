<?php
namespace Home\Controller;
use Think\Controller;
class FyrzADController extends Controller {
    public function temp(){
        //layout(true);
        layout(false);

        //$this->show('<style type="text/css">*{ padding: 0; margin: 0; } div{ padding: 4px 48px;} body{ background: #fff; font-family: "微软雅黑"; color: #333;font-size:24px} h1{ font-size: 100px; font-weight: normal; margin-bottom: 12px; } p{ line-height: 1.8em; font-size: 36px } a,a:hover{color:blue;}</style><div style="padding: 24px 48px;"> <h1>:)</h1><p>欢迎使用 <b>ThinkPHP</b>！</p><br/>版本 V{$Think.version}</div><script type="text/javascript" src="http://ad.topthink.com/Public/static/client.js"></script><thinkad id="ad_55e75dfae343f5a1"></thinkad><script type="text/javascript" src="http://tajs.qq.com/stats?sId=9347272" charset="UTF-8"></script>','utf-8');

        $this->display("FyrzAD/Public/temp");

    }
    public function index(){
		layout(true);
		//$this->redirect('FyrzAD/login');
        $this->display();
       // $this->display("FyrzAD/index");
    }

    public function login($status = '1'){
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
    public function postLogin(){
        $username = I('post.username','');
        $password = I('post.password','');


        if ($password == '' or $username == '') {
            $this->redirect('FyrzAd/login', 'status=2');
        } else {
            session('username', 'dabo');
            session('level', 1);
            $this->redirect('Dashboard/dashboard');


        }


    }
    public function resetLogin(){
        layout(false);
        if (! session('user_name', null)) {
            $this->redirect('FyrzAD/login');
        }
    }

    public function main(){
        layout(false);
        $this->display("FyrzAD/main");
    }
	public function changepwd(){
			layout(false);
			//$this->display("changepwd");
            $this->display("FyrzAD/User/changepwd");
	}
	/*用户设置*/
	public function myloginfo(){
			layout(false);
			$this->display("FyrzAD/User/myloginfo");
	}
	public function personInfo(){
			layout(false);
			$this->display("FyrzAD/User/personInfo");
	}
	/*订单管理*/
	public function orderAD()
    {
        layout(false);
        $this->display("FyrzAD/ManageAD/orderAD");
    }
    public function checkAD()
    {
        layout(false);
        $this->display("FyrzAD/ManageAD/checkAD");
    }
    public function redactAD()
    {
        layout(false);
        $this->display("FyrzAD/ManageAD/redactAD");
    }
    public function orderCheck()
    {
        layout(false);
        $this->display("FyrzAD/ManageAD/orderCheck");
    }
    public function orderRedact()
    {
        layout(false);
        $this->display("FyrzAD/ManageAD/orderRedact");
    }

/* AP管理*/

    public function districtManageAP(){//区域维护管理
        layout(false);
        $this->display("FyrzAD/ManageAP/districtManageAP");
    }
    public function sceneManageAP(){//场景维护管理
        layout(false);
        $this->display("FyrzAD/ManageAP/sceneManageAP");
    }
    public function ManageAP(){//AP维护管理
        layout(false);
        $this->display("FyrzAD/ManageAP/ManageAP");
    }

}

