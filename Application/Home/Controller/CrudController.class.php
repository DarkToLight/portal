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
            $p = str_replace(" ","", $p);
        }
        foreach ($_GET as &$g) {
            $p = str_replace(" ","", $g);
        }
        $this->model = M(CONTROLLER_NAME);
        if (empty(session("login_user"))) {
            $this->display('Index/login');
        }
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
            if(method_exists($this,"_saveEdit")){ # 保存数据前对数据进行处理
                $this->_saveEdit();
            }
            if($this->model->where($where)->save($_POST)) {
                $result['status'] = 1;
                $result['msg'] = "更新成功！";
                if(method_exists($this,"saveEdit_")) {
                    $this->saveEdit_();
                }
                $this->ajaxReturn($result,"JSON");
            }else {
                $result['status'] = -1;
                $result['msg'] = "更新失败或未作修改！";
                $this->ajaxReturn($result,"JSON");
            }
        } else {
            if($info = $this->exists($where)) {
                $this->assign('data', $info);
                if(method_exists($this,"edit_")){ # edit数据处理
                    $this->edit_($info);
                }
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
    # 批量删除
    public function batchDel()
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
        $where['is_del'] = 0;
        if(method_exists($this,'_lists')){
            $this->_lists($where);
        }
        $tgtPage = abs(I('get.page', 1));
        $pageSize = abs(I('get.limit', 10));
        $getAll = I('get.getAll', false);
        # 获取所有
        if ($getAll == "true") {
            $crtData = $this->model->where($where)->select();
            $back = new \stdClass();
            $back->code = 0;
            $back->msg = "成功";
            $back->data = $crtData;
        } else {   # 分页获取
            $rowCnt = $this->model->where($where)->count('id');
            $total = ceil($rowCnt / $pageSize);
            if ($tgtPage > $total) {
                $tgtPage = $total;
            }
            $offset = ($tgtPage - 1) * $pageSize;
            $crtData = $this->model->where($where)->limit($offset, $pageSize)->select();
            $pageBar = new PageBar($tgtPage, $crtData, $rowCnt, '', $_GET);
            $back = new \stdClass();
            $back->code = 0;
            $back->count = $pageBar->rowCnt;
            $back->msg = "成功";
            $back->data = $pageBar->data;
        }

        if(method_exists($this,'lists_')){
            $this->lists_($back);
        }
        $this->ajaxReturn($back, "JSON");
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