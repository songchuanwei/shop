<?php
namespace app\admin\controller;
use think\Controller;
use think\Session;
use app\model\Admins;

class Admin extends Base
{
	//店铺列表
    public function getIndex()
    {
        $admins=Admins::order('create_time')->select();
        return view('admin/index',compact('admins'));
    }

    //添加店铺
    public function getAdd()
    {
        return view('admin/add');
    }
    //处理添加店铺
    public function postDoadd()
    {
        // 获取表单上传文件  
        $file = request()->file('img');  
        if(!empty($file)) {  
             // 移动到框架应用根目录/public/uploads/ 目录下  
            $info = $file->move(ROOT_PATH.'public'.DS.'upload'); 
            if($info){
                $data['img'] = '/upload/'.date('Ymd',time()).'/'.$info->getFilename();
            }else{
                return ['error'=>1,'msg'=>'上传头像失败'];
            }
        }else{
            return ['error'=>1,'msg'=>'请上传头像'];
        }   


        $admin1=Admins::where('phone',input('phone'))->whereOr('username',input('username'))->find();
        if($admin1){
            return ['error'=>1,'msg'=>'此店铺已被注册，请更换管理人姓名或手机号'];
        }

        $data['username']=input('username');
        $data['name']=input('name');
        $data['address']=input('address');
        $data['phone']=input('phone');
        $data['content']=input('content');
        $data['type']=0;
        $data['status']=1;
        $data['password']=md5(input('password'));
        $data['create_time']=date('Y-m-d H:i:s');
        
        $admin = Admins::create($data);

        if($admin){
            return ['error'=>0,'msg'=>'添加店铺成功'];
        }else{
            return ['error'=>1,'msg'=>'添加店铺失败'];
        }
    }


    //编辑店铺信息
    public function getEdit()
    {
        $admin=Admins::find(input('id'));
        return view('admin/edit',compact('admin'));
    }
    //处理编辑店铺信息
    public function postDoedit() 
    {
        $admin=Admins::find(input('id'));

        if($admin->username!=input('username')){
            $admin1=Admins::where('username',input('username'))->find();
            if($admin1){
                return ['error'=>1,'msg'=>'此店铺已被注册，请更换店铺管理人员姓名或手机号'];
            }
            $admin->username=input('username');
        }
        if($admin->phone!=input('phone')){
            $admin1=Admins::where('phone',input('phone'))->find();
            if($admin1){
                return ['error'=>1,'msg'=>'此店铺已被注册，请更换店铺管理人员姓名或手机号'];
            }
            $admin->phone=input('phone');
        }

        if(input('password')){
            if(md5(input('password')==$admin->password)){
                return ['error'=>1,'msg'=>'新密码与原密码相同'];
            }
            $admin->password=md5(input('password'));
        }

        $files = request()->file('imgs');
        if($files) {  
            $admin->imgs='';
             // 获取表单上传文件  
            foreach($files as $file){
                // 移动到框架应用根目录/public/uploads/ 目录下  
                $info = $file->move(ROOT_PATH.'public'.DS.'upload'); 
                if($info){
                    $admin->imgs .= '/upload/'.date('Ymd',time()).'/'.$info->getFilename().',';
                }else{
                    return ['error'=>1,'msg'=>'上传头像失败'];
                }
            }
        }  

        $admin->name=input('name');
        $admin->address=input('address');
        $admin->content=input('content');

        if($admin->save()){
            return ['error'=>0,'msg'=>'店铺信息修改成功'];
        }else{
            return ['error'=>1,'msg'=>'店铺信息修改失败'];
        }
    }

    //查看店铺详情
    public function getShow()
    {
        $admin=Admins::find(input('id'));
        return view('admin/show',compact('admin'));
    }

    //修改状态
    public function getStatus()
    {
        $admin=Admins::find(input('id'));
        $admin->status=input('status');
        if($admin->save()){
            return ['error'=>0,'msg'=>'修改状态成功'];
        }else{
            return ['error'=>1,'msg'=>'修改状态失败'];
        }
    }

    //修改类型
    public function getType()
    {
        $admin=Admins::find(input('id'));
        $admin->type=input('type');
        if($admin->save()){
            return ['error'=>0,'msg'=>'修改类型成功'];
        }else{
            return ['error'=>1,'msg'=>'修改类型失败'];
        }
    }



}
