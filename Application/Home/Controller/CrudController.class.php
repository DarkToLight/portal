<?php
/*
 +----------------------------------------
 |对数据进行CRUD的基本类，主要适用于单表
 +----------------------------------------
 |Auth:<dark2light@qq.com>
 +----------------------------------------
 |version:latest
 +----------------------------------------
 |main:对单表进行增删改查
 +----------------------------------------
*/
namespace Home\Controller;

use Org\Util\PageBar;
use think\Controller;

class CrudController extends Controller
{
    private $model;
    public function __construct()
    {
        parent::__construct();
        foreach ($_POST as &$p) {
            $p = trim($p);
        }
        foreach ($_GET as &$g) {
            $g = trim($g);
        }
        $this->model = M(CONTROLLER_NAME);
    }
    # 新增数据
    public function add()
    {
        if(method_exists($this,"_add")) {
            $this->_add();
        }
        if(IS_AJAX) {
            if($addId = $this->model->add($_POST)){
                $result['status'] = 1;
                $result['msg'] = "新增成功！";
                if (method_exists($this, "add_")) {
                    $this->add_($addId);
                }
                $this->ajaxReturn($result,"JSON");
            }else {
                $result['status'] = -1;
                $result['msg'] = "新增失败！";
                $this->ajaxReturn($result,"JSON");
            }
        } else {
            $this->display(CONTROLLER_NAME."/".ACTION_NAME);
        }
    }
    # 编辑数据
    public function edit()
    {
        $id = $_REQUEST['id'];
        $where['is_del'] = 0;
        $where ['id'] = $id;
        if(method_exists($this,"_edit")) {
            $this->_edit();
        }
        if (IS_AJAX) {
            if($this->model->where($where)->save($_POST)) {
                $result['status'] = -1;
                $result['msg'] = "更新成功！";
                $this->ajaxReturn($result,"JSON");
            }else {
                $result['status'] = -1;
                $result['msg'] = "更新失败！";
                $this->ajaxReturn($result,"JSON");
            }
        } else {
            if($info = $this->exists($where)) {
                $this->assign('data', $info);
                var_dump($info);
                $this->display(CONTROLLER_NAME."/".ACTION_NAME);
            } else {
                echo "<script>history.back()</script>";
            }
        }
    }
    # 删除数据
    public function del()
    {
        if (IS_AJAX) {
            $id = (int)$_REQUEST['id'];
            $truth = $_REQUEST['truth'];
            if(method_exists($this,"_del")) {
                $this->_del($id);
            }
            if ($truth == 'true') { # 真正的从数据库删除
                $deleteResult = $this->model->where("id={$id}")->delete();
            } else { # 软删除
                $this->model->is_del = 1;
                $deleteResult =$this->model->where("id={$id}")->save();

            }

            if  ($deleteResult) {
                $backData = ['status' => 1, 'msg' => '删除成功'];
            } else {
                $backData = ['status' => -1, 'msg' => '删除失败'];
            }

            if(method_exists($this,'del_')){
                $this->del_($id);
            }
            $this->ajaxReturn($backData,"JSON");
        } else {
            die( "请使用Ajax请求");
        }
    }
    # 分页列出数据
    public function lists()
    {
        $tgtPage = abs(I('get.page', 1));
        $pageSize = abs(I('get.limit', 10));

        $rowCnt = $this->model->count('id');

        $total = ceil($rowCnt / $pageSize);
        if ($tgtPage > $total) {
            $tgtPage = $total;
        }

        $offset = ($tgtPage - 1) * $pageSize;
        $crtData = $this->model->where('is_del = 0')->limit($offset, $pageSize)->select();

        $pageBar = new PageBar($tgtPage, $crtData, $rowCnt, '', $_GET);

        $back = new \stdClass();
        $back->code = $tgtPage -1;
        $back->count = $pageBar->rowCnt;
        $back->msg = "成功";
        $back->data = $pageBar->data;
        $this->ajaxReturn($back, "JSON");
        $this->display(CONTROLLER_NAME."/".ACTION_NAME);
    }
    public function exists($where)
    {
        $data = $this->model->where($where)->find();
        if(!empty($data)){
            return $data;
        } else {
            return false;
        }
    }
}