<?php

namespace app\model;

use think\Model;

class Users extends Model
{
	// 设置当前模型对应的完整数据表名称
    protected $table = 'sp_users';

    //我的所有订单
    public function orders(){
       return $this->hasMany('Orders','user_id','id');
    }

    //我的收货地址
    public function addresss(){
       return $this->hasMany('Addresss','user_id','id');
    }


    //我的购物车
    public function goods(){
      return $this->belongsToMany('Goods','user_good','good_id','user_id')->where('type',1);
    }

    //我的喜欢
    public function loves(){
      return $this->belongsToMany('Goods','user_good','good_id','user_id')->where('type',2);
    }

    //我的对比
    public function compares(){
      return $this->belongsToMany('Goods','user_good','good_id','user_id')->where('type',3);
    }



     //我的客服
    public function services(){
       return $this->hasMany('Services','user_id','id');
    }


    //登陆用户是否有此商品订单
    public function userHasGood($good_id){
        if(session('id')){

            $orders=$this->hasMany('Orders','user_id','id')->where('is_pay','>',0)->select();
            foreach ($orders as $order) {
              foreach ($order->goods()->select() as $good) {
                  if($good_id==$good->id){
                    return 1;
                  }
              }
            }

            return 0;
        }else{
            return 0;
        } 
    }


}