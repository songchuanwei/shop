<?php

namespace app\model;

use think\Model;

class Addresss extends Model
{
	// 设置当前模型对应的完整数据表名称
    protected $table = 'sp_addresss';

    //收货地址属于用户
    public function user()
    {
        return $this->belongsTo('Users','user_id');
    }
    

}