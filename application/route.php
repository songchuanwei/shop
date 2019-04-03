<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

use think\Route;

Route::group('admin',function(){
	Route::controller('/login','admin/Login'); //后台登陆

	Route::controller('/index','admin/Index'); //后台首页
	Route::controller('/blog','admin/Blog'); //后台公告管理
	Route::controller('/user','admin/User'); //后台用户管理
	Route::controller('/goodtype','admin/Goodtype'); //后台商品类型管理
	Route::controller('/good','admin/Good'); //后台商品管理
	Route::controller('/admin','admin/Admin'); //后台店铺管理
	Route::controller('/order','admin/Order'); //后台店铺管理
	Route::controller('/service','admin/Service'); //后台客服管理


});

Route::get('/','index/Index/getIndex'); //前台首页
Route::controller('/index','index/Index'); //前台首页
Route::controller('/login','index/Login'); //前台登陆
Route::controller('/good','index/Good'); //前台商品
Route::controller('/order','index/Order'); //前台订单管理
Route::controller('/address','index/Address'); //前台收货地址管理
Route::controller('/blog','index/Blog'); //前台公告管理
