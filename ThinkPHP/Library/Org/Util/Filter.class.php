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
use Think\Exception;

class Filter
{
    private static $get;
    private static $post;

    /**
     * @param $must 不能为空的表单项
     * @param string $type 传入方式，默认post
     * @throws \Exception
     */
    public static function notEmpty(Array $must, $type = 'post')
    {
        self::$get = &$_GET;
        self::$post= &$_POST;
        $tmp = array();
        foreach($must as  $key => $val) {
            if (is_numeric($key)) {
                if (empty(self::$$type[$val])) {
                    throw new \Exception($val."参数不能为空");
                } else {
                    $tmp[] = self::$$type[$val];
                }
            }else{
                if(empty(self::$$type[$key])){
                    # 设置默认值
                    self::$$type[$key] = $val;
                    $tmp[] = $val;
                } else {
                    $tmp[] = self::$$type[$key];
                }
            }
        }
        return $tmp;
    }
}
