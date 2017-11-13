<?php
namespace Home\Model;

use Think\Model;

class BaseModel extends Model
{
    public function exists($where)
    {
        $data = $this->where($where)->find();
        if(!empty($data)){
            return $data;
        } else {
            return false;
        }
    }
}