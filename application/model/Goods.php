<?php

namespace app\model;

use think\Model;

class Goods extends Model
{
	// 设置当前模型对应的完整数据表名称
    protected $table = 'sp_goods';

    //商品属于商家
    public function admin()
    {
        return $this->belongsTo('Admins','admin_id');
    }

    //商品属于商品类型
    public function good_type()
    {
        return $this->belongsTo('Good_types','good_type_id');
    }


    //商品的所有评价
    public function comments()
    {
        return $this->hasMany('Comments','good_id','id');
    }



    //商品是否有登陆用户喜欢
    public function loveHasUser(){
        if(session('id')){
            return $this->belongsToMany('Users','user_good','user_id','good_id')->where('type',2)->where('user_id',session('id'))->count();
        }else{
            return 0;
        } 
    }


    //商品是否有登陆用户对比
    public function compareHasUser(){
        if(session('id')){
            return $this->belongsToMany('Users','user_good','user_id','good_id')->where('type',3)->where('user_id',session('id'))->count();
        }else{
            return 0;
        } 
    }
    

}