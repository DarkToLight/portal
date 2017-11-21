<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/11/14
 * Time: 10:02
 */

class DBCtl
{
    private $connect;
    public function __construct($conf, $mode='short')
    {
        foreach ($conf as $key => $val) {
            $$key = $val;
        }
        $long = "";
        if($mode == "long") {
            $long = "p:";
        }
        $this->connect = new \mysqli($long.$host, $user, $password, $database, $port);
        if (!$this->connect) {
            die("数据库连接失败！");
        }
    }
    public function insert($table, $data)
    {
        $i = 1;
        $total = count($data);
        $field = "(" ;
        $value = "(" ;
        foreach ($data as $key => $val) {
            if ($i == $total) {
                $field .= $key;
                $value .= '"'.$val.'"';
            } else {
                $field .= $key .",";
                $value .= '"'.$val.'",';
            }
            $i++;
        }
        $field .= ")";
        $value .= ")";
        $insert = "insert into {$table} {$field} value {$value}";
        $this->connect->query($insert);
    }
    public function update()
    {

    }
}