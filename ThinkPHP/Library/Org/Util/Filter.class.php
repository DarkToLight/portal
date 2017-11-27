<?php
namespace Org\Util;
/*
 +----------------------------------------
 |过滤传过来的参数:Filter.class.php
 +----------------------------------------
 |Auth:<dark2light@qq.com>
 +----------------------------------------
 |version:v1.0.0
 +----------------------------------------
 |main:过滤非法的表单数据,给数据赋默认值值
 +----------------------------------------
*/

class Filter
{
    /**
     * @param $must 不能为空的表单项
     * @param string $type 传入方式，默认post
     * @throws \Exception
     */
    public static function notEmpty(Array $must, $type = 'post')
    {
        if ($type == "post") {
            $type = &$_POST;
        } else {
            $type = &$_GET;
        }
        foreach($must as  $key => $val) {
            if (is_numeric($key)) {
                if (empty($type[$val])) {
                    throw new \Exception($val."参数不能为空");
                } else {
                    $tmp[] = $type[$val];
                }
            }else{
                if(empty($type[$key])){
                    # 设置默认值
                    $type[$key] = $val;
                    $tmp[] = $val;
                } else {
                    $tmp[] = $type[$key];
                }
            }
        }
        return $tmp;
    }
}
