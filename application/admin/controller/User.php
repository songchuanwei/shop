<?php
namespace app\admin\controller;
use think\Controller;
use think\Session;
use app\model\Users;

class User extends Base
{
	//用户列表
    public function getIndex()
    {
        $users=Users::order('create_time')->select();
        return view('user/index',compact('users'));
    }

    //添加用户
    public function getAdd()
    {
        return view('user/add');
    }
    //处理添加用户
    public function postDoadd()
    {
        $user1=Users::where('phone',input('phone'))->whereOr('username',input('username'))->find();
        if($user1){
            return ['error'=>1,'msg'=>'此用户已被注册，请更换用户名或手机号'];
        }

        $user = Users::create([
		    'username'  =>  input('username'),
		    'phone' =>  input('phone'),
            'money' =>  input('money'),
            'password' =>  md5(input('phone')),
            'status' =>  1,
		    'create_time'=>date('Y-m-d H:i:s')
		]);

		if($user){
			return ['error'=>0,'msg'=>'用户添加成功'];
		}else{
			return ['error'=>1,'msg'=>'用户添加失败'];
		}
    }

    //编辑用户
    public function getEdit()
    {
        $user=Users::find(input('id'));
        return view('user/edit',compact('user'));
    }
    //处理编辑用户
    public function postDoedit() 
    {

        $user=Users::find(input('id'));
        $user->money=input('money');

        if($user->username!=input('username')){
            $user1=Users::where('username',input('username'))->find();
            if($user1){
                return ['error'=>1,'msg'=>'此用户已被注册，请更换用户名或手机号'];
            }
            $user->username=input('username');
        }
        if($user->phone!=input('phone')){
            $user1=Users::where('phone',input('phone'))->find();
            if($user1){
                return ['error'=>1,'msg'=>'此用户已被注册，请更换用户名或手机号'];
            }
            $user->phone=input('phone');
        }

        if(input('password')){
            if(md5(input('password'))==$user->password){
                return ['error'=>1,'msg'=>'新密码与原密码相同'];
            }
            $user->password=md5(input('password'));
        }

        if($user->save()){
            return ['error'=>0,'msg'=>'用户修改成功'];
        }else{
            return ['error'=>1,'msg'=>'用户修改失败'];
        }
    }

    //编辑用户
    public function getShow()
    {
        $user=Users::find(input('id'));
        return view('user/show',compact('user'));
    }

    //修改状态
    public function getStatus()
    {
        $user=Users::find(input('id'));
        $user->status=input('status');
        if($user->save()){
            return ['error'=>0,'msg'=>'修改状态成功'];
        }else{
            return ['error'=>1,'msg'=>'修改状态失败'];
        }
    }
    


}
