<?php
namespace Home\Model;

use Think\Model;

class BaseModel extends Model
{
    # 判断一条数据在数据库中是否存在
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