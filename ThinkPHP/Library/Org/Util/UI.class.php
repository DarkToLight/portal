<?php
namespace Org\Util;

class UI
{
    public static $layUIPath;
    public static function get($UIName = 'layui')
    {
        $css = '  <link rel="stylesheet" href="%s">';
        $css = sprintf($css, "/{$UIName}/src/css/layui.css");
        $js = '<script src="%s"></script>';
        $js = sprintf($js, "/{$UIName}/src/layui.js");
        return $css . $js;
    }
}