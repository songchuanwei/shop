<?php

namespace app\model;

use think\Model;

class Comments extends Model
{
	// 设置当前模型对应的完整数据表名称
    protected $table = 'sp_comments';

    //评论属于用户
    public function user()
    {
        return $this->belongsTo('Users','user_id');
    }

    //评论属于商品
    public function good()
    {
        return $this->belongsTo('Goods','good_id');
    }
    

}