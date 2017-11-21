<?php
/*
 +----------------------------------------
 |对树形结构的数据进行操作:UnlimitedClassification.class.php
 +----------------------------------------
 |Auth:<dark2light@qq.com>
 +----------------------------------------
 |version:v1.0.0
 +----------------------------------------
 |date:2017-11-20
 +----------------------------------------
*/
namespace Org\Util;

class UnlimitedClassification
{
    public static $html;

    /**
     * @param $treeRow  无限极分类思想的数据记录 {id, parent_id}
     * @param $pid      parent_id
     * @param string $parentIdFieldName 适配表设计的时候字段名称不为parent_id
     * @return array   返回一个树形结构的数组
     */
    public static function tidy($treeRow, $parentIdFieldName = "parent_id")
    {
        $tree = array();
        //第一步，将分类id作为数组key,并创建children单元
        foreach ($treeRow as $row) {
            $tree[$row['id']] = $row;
            $tree[$row['id']]['children'] = array();
        }
        //第二步，利用引用，将每个分类添加到父类children数组中，这样一次遍历即可形成树形结构。
        foreach ($tree as $key => $item) {
            if ($item[$parentIdFieldName] != 0) {
                $tree[$item[$parentIdFieldName]]['children'][] = &$tree[$key];//注意：此处必须传引用否则结果不对
                if ($tree[$key]['children'] == null) {
                    unset($tree[$key]['children']); //如果children为空，则删除该children元素（可选）
                }
            }
        }
        ////第三步，删除无用的非根节点数据
        foreach ($tree as $key => $row) {
            if ($row['parent_id'] != 0) {
                unset($tree[$key]);
            }
        }
        return $tree;
    }

    /**
     * 递归遍历生成树形结构
     * @param $treeRow  无限极分类思想的数据记录 {id, parent_id}
     * @param $pid      parent_id
     * @param string $parentIdFieldName 适配表设计的时候字段名称不为parent_id
     * @return array   返回一个树形结构的数组
     */
    public static function recursion($treeRow, $pid, $deep = 1, $parentIdFieldName = "parent_id")
    {
        foreach ($treeRow as $row) {
            if ($row[$parentIdFieldName] == $pid) {                      //匹配子记录
                $deep++;
                $row['children']['deep'] = $deep;
                $row['children'] = self::recursion($treeRow, $row['id'], $deep); //递归获取子记录
                if ($row['children'] == null) {
                    unset($row['children']);             //如果子元素为空则unset()进行删除，说明已经到该分支的最后一个元素了（可选）  
                }
                $tree[] = $row;                           //将记录存入新数组  
            }
        }
        return $tree;                                  //返回新数组  
    }
}
?>