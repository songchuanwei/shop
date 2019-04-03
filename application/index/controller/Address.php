<?php
namespace app\index\controller;
use think\Controller;
use think\Session;
use app\model\Users;
use app\model\Addresss;

class Address extends Base
{

    //添加收货地址
    public function getAdd()
    {
        homeLogin();
        return view('address/add');
    }
    //处理添加收货地址
    public function postDoadd()
    {
        $user=Users::find(session('id'));

        $address = Addresss::create([
            'name'  =>  input('name'),
            'user_id'  =>  $user->id,
            'phone'  =>  input('phone'),
            'address'  =>  input('address'),
            'status' =>  1,
            'create_time'=>date('Y-m-d H:i:s')
        ]);

        if($address){
            return ['error'=>0,'msg'=>'添加收货地址成功'];
        }else{
            return ['error'=>1,'msg'=>'添加收货地址失败'];
        }
    }

    //编辑收货地址
    public function getEdit()
    {
        homeLogin();
        $address=Addresss::find(input('id'));
        return view('address/edit',compact('address'));
    }
    //处理编辑收货地址
    public function postDoedit() 
    {
        $address=Addresss::find(input('id'));
        $address->name=input('name');
        $address->phone=input('phone');
        $address->address=input('address');

        if($address->save()){
            return ['error'=>0,'msg'=>'修改收货地址成功'];
        }else{
            return ['error'=>1,'msg'=>'修改收货地址失败'];
        }
    }

    //删除收货地址
    public function getDel()
    {
        $address=Addresss::find(input('id'));
        $address->status=0;
        if($address->save()){
            return ['error'=>0,'msg'=>'删除收货地址成功'];
        }else{
            return ['error'=>1,'msg'=>'删除收货地址失败'];
        }
    }

    

}
