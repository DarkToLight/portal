<?php
namespace Home\Controller;
use Think\Controller;

class DashboardController extends Controller
{

	function dashboard(){
		$this->assign('Dashboard_active', 'active');
		return $this->display();
	}
}
