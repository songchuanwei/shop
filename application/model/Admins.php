<?php

namespace app\model;

use think\Model;

class Admins extends Model
{
	// 设置当前模型对应的完整数据表名称
    protected $table = 'sp_admins';

    //店铺的特定用户客服
    public function services($user_id){
       return $this->hasMany('Services','admin_id','id')->where('user_id',$user_id);
    }


    //店铺的客服
    public function adminservices(){
       return $this->hasMany('Services','admin_id','id');
    }

}