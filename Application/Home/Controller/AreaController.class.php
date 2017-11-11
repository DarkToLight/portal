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

class AreaController extends CrudController
{
    public function _add()
    {
        if (1) {
            $_POST['name'] = "高新区";
            $_POST['parent_id'] = "";
            $_POST['create_time'] = date("Y-m-d H:i:s");
            # 数据过滤
            try{
                $must = ['name', 'parent_id' => 100];
                Filter::notEmpty($must);
            }catch (\Exception $e) {
                $this->ajaxReturn(['status' => -100, 'msg' => $e->getMessage()]);
            }
            # 数据唯一性判断
            $where = ['name' => $_POST['name'], 'parent_id' => $_POST['parent_id']];
            if ($this->exists($where)) {
                $this->ajaxReturn(['status' => -2, 'msg' =>'不能添加重复的区域或场景']);
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