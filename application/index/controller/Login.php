<?php
namespace app\index\controller;
use think\Controller;
use think\Session;
use app\model\Users;

class Login extends Base
{
    //前台登陆
    public function getLogin()
    {
        homeLogout();
        return view('login/login');
    }
    //处理前台登陆
    public function postDologin()
    {
        if($_POST){

            $user=Users::where('username',$_POST['username'])->where('status',1)->find();

            if(!$user){
                $user1=Users::where('phone',$_POST['username'])->where('status',1)->find();
                if($user1){
                    if($user1->password == md5($_POST['password'])){
                        Session::set('username',$user1->username);
                        Session::set('id',$user1->id);
                        return ['error'=>0,'msg'=>'登陆成功'];
                    }else{
                        return ['error'=>1,'msg'=>'账号或密码错误！'];
                    }
                }else{
                    return ['error'=>1,'msg'=>'账号或密码错误！'];
                }  
            }else{
                if($user->password == md5($_POST['password'])){
                    Session::set('username',$user->username);
                    Session::set('id',$user->id);
                    return ['error'=>0,'msg'=>'登陆成功'];
                }else{
                    return ['error'=>1,'msg'=>'账号或密码错误！'];
                }
            }
            
        }else{
            return ['error'=>1,'msg'=>'账号或密码错误！'];
        }
    }


    //前台注册
    public function getRegister()
    {
        homeLogout();
        return view('login/register');
    }
    //处理前台注册
    public function postDoregister()
    {


        $user1=Users::where('phone',input('phone'))->whereOr('username',input('username'))->find();
        if($user1){
            return ['error'=>1,'msg'=>'此用户已被注册，请更换用户名或手机号'];
        }

        $data['username']=input('username');
        $data['phone']=input('phone');
        $data['money']=0;
        $data['status']=1;
        $data['password']=md5(input('password'));
        $data['create_time']=date('Y-m-d H:i:s');
        
        $user = Users::create($data);

        if($user){
            Session::set('username',$user->username);
            Session::set('id',$user->id);
            return ['error'=>0,'msg'=>'注册成功'];
        }else{
            return ['error'=>1,'msg'=>'注册失败'];
        }
    }


    //退出
    public function getLogout()
    {
        homeLogin();
        Session::clear();
        $this->redirect('/index/index', [], 302, ['success' => '退出成功']);
    }


    //个人信息修改
    public function getUser(){
        homeLogin();

        $user=Users::find(session('id'));

        return view('login/user',compact('user'));
    }

    //处理个人信息修改
    public function postDouser(){
        $user = Users::find(input('id')); 

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
            Session::set('username',$user->username);
            Session::set('id',$user->id);
            return ['error'=>0,'msg'=>'修改成功'];
        }else{
            return ['error'=>1,'msg'=>'修改失败'];
        }
    }



}
