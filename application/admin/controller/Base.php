<?php
namespace app\admin\controller;
use think\Controller;
use think\Session;

class Base extends Controller
{
	//后台登陆auth限制
    public function _initialize()
	{
		 if(!session('admin_username')){
			 $this->error('请先登录！',url('/admin/login/login'));
		 }
	}

}
