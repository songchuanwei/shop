<?php

namespace app\index\controller;

use think\Controller;
use app\model\Users;
use app\model\Admins;
use app\model\GoodTypes;

/*
 * 基类
 */

class Base extends Controller
{

    public function _initialize()
    {
        parent::_initialize();

        $user=Users::where('id',session('id'))->find();

        $adminindex=Admins::where('status',1)->order('create_time','desc')->limit(6)->select();

        $goodtypeindex=GoodTypes::where('status',1)->order('create_time','desc')->limit(6)->select();
       
        $this->assign('user', $user);
        $this->assign('adminindex', $adminindex);
        $this->assign('goodtypeindex', $goodtypeindex);
    }
    
    
}

