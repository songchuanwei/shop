<?php

namespace app\index\controller;

use think\Controller;
use app\model\Goods;
use app\model\Users;
use app\model\Admins;
use app\model\GoodTypes;

/*
 * 基类
 */

class Baseleft extends Controller
{

    public function _initialize()
    {
        parent::_initialize();

        //全局模板用户
        $user=Users::where('id',session('id'))->find();

        //全局模板店铺 
        $adminindex=Admins::where('status',1)->order('create_time','desc')->limit(6)->select();

        //全局模板商品类型
        $goodtypeindex=GoodTypes::where('status',1)->order('create_time','desc')->limit(6)->select();


        $goodtypes=$goodtypeindex;

        //促销商品
        $maps['a_price'] = ['>', "price"];
        $goods1=Goods::where('a_price','<>',0)->where($maps)->limit(3)->select();


        //获取所有分类
        $this->assign('goodtypes', $goodtypes);
        $this->assign('goods1', $goods1);
        $this->assign('user', $user);

        $this->assign('adminindex', $adminindex);
        $this->assign('goodtypeindex', $goodtypeindex);
    }
    
    
}

