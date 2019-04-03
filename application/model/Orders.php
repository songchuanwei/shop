<?php

namespace app\model;

use think\Model;

class Orders extends Model
{
	// 设置当前模型对应的完整数据表名称
    protected $table = 'sp_orders';

    //订单属于用户
    public function user()
    {
        return $this->belongsTo('Users','user_id');
    }

    //订单的所有商品
    public function goods(){
      return $this->belongsToMany('Goods','order_good','good_id','order_id');
    }


    //订单属于地址
    public function address()
    {
        return $this->belongsTo('Addresss','address_id');
    }


}