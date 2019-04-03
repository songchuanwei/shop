<?php

namespace app\model;

use think\Model;

class GoodTypes extends Model
{
	// 设置当前模型对应的完整数据表名称
    protected $table = 'sp_good_types';

    //商品类型下的所有商品
    public function goods()
    {
        return $this->hasMany('Goods','good_type_id','id');
    }
    

}