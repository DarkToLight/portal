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
}