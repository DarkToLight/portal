<?php
namespace Home\Controller;
use Think\Controller;
use Org\Util\Tree;
class FyrzADController extends Controller {
    public function temp(){
        //layout(true);
        layout(false);

        //$this->show('<style type="text/css">*{ padding: 0; margin: 0; } div{ padding: 4px 48px;} body{ background: #fff; font-family: "微软雅黑"; color: #333;font-size:24px} h1{ font-size: 100px; font-weight: normal; margin-bottom: 12px; } p{ line-height: 1.8em; font-size: 36px } a,a:hover{color:blue;}</style><div style="padding: 24px 48px;"> <h1>:)</h1><p>欢迎使用 <b>ThinkPHP</b>！</p><br/>版本 V{$Think.version}</div><script type="text/javascript" src="http://ad.topthink.com/Public/static/client.js"></script><thinkad id="ad_55e75dfae343f5a1"></thinkad><script type="text/javascript" src="http://tajs.qq.com/stats?sId=9347272" charset="UTF-8"></script>','utf-8');

        $this->display();

    }
    public function index(){
		layout(true);
		//$this->redirect('FyrzAD/login');
        $this->display();
       // $this->display("FyrzAD/index");
    }
    public function main(){
        layout(false);
        $this->display();
    }
    public function changepwd(){
        layout(false);
        //$this->display("changepwd");
        $this->display();
    }
    /*用户设置*/
    public function myloginfo(){
        layout(false);
        $this->display();
    }
    public function personInfo(){
        layout(false);
        $this->display();
    }

}

