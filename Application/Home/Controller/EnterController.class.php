<?php
namespace Home\Controller;
use Think\Controller;
class EnterController extends Controller {
    public function index()
    {
        $this->display('FyrzAD/index');

    }
    public function main(){
        layout(false);
        $this->display("FyrzAD/main");
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