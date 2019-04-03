<?php
namespace app\admin\controller;
use think\Controller;
use think\Session;
use app\model\Admins;

class Index extends Base
{

    public function getIndex()
    {
    	$user=Admins::where('username',session('admin_username'))->find();
        return view('index/index',compact('user'));
    }

    public function getLogout()
    {
        Session::clear();
        $this->success('退出成功', '/admin/login/login');
    }

}
