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
        if (IS_AJAX) {
            $_POST['name'] = "泛亚科技";
            $_POST['parent_id'] = "2";
            $_POST['create_time'] = date("Y-m-d H:i:s");

            try{
                $must = ['name', 'parent_id' => 0];
                list(, $parent_id) = Filter::notEmpty($must);

                # 上级分类存在判断
                $mArea = D('area');
                if($parent_id != 0 && !$mArea->exists(['id' => $parent_id])) {
                    throw new \Exception("上级分类不存在！");
                }

                # 数据唯一性判断
                $where = ['name' => $_POST['name'], 'parent_id' => $_POST['parent_id']];
                if ($this->exists($where)) {
                    throw new \Exception("不能添加重复的区域或场景！");
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