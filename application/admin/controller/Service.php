<?php
namespace app\admin\controller;
use think\Controller;
use think\Session;
use app\model\Services;
use app\model\Admins;
use app\model\Users;

class Service extends Base
{
	//客服列表
    public function getIndex()
    {
        $admin=Admins::find(session('admin_id'));

        $services=$admin->adminservices()->order('create_time','desc')->group('user_id')->select();

        return view('service/index',compact('services'));
    }



    //客服详情
    public function getShow()
    {
        $admin=Admins::find(session('admin_id'));
        $user=Users::find(input('user_id'));
        return view('service/show',compact('admin','user'));
    }


    //处理客服回复消息
    public function postDoshow()
    {

        $service = Services::create([
            'admin_id'=>session('admin_id'),
            'user_id'=>input('user_id'),
            'content' =>  input('content'),
            'type' =>  2,
            'create_time'=>date('Y-m-d H:i:s'),
        ]);

        if($service){
            return ['error'=>0,'msg'=>'回复成功'];
        }else{
            return ['error'=>1,'msg'=>'回复失败'];
        }

    }



    //删除回复
    public function getDel()
    {
        $service=services::find(input('id'));

        if($service->delete()){
            return ['error'=>0,'msg'=>'删除回复成功'];
        }else{
            return ['error'=>1,'msg'=>'删除回复失败'];
        }
    }

    //删除回复
    public function getDeluser()
    {
        $service=Services::where('user_id',input('id'))->where('admin_id',session('admin_id'))->delete();

        if($service){
            return ['error'=>0,'msg'=>'删除回复成功'];
        }else{
            return ['error'=>1,'msg'=>'删除回复失败'];
        }
    }
    

}
