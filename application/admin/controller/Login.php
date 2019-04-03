<?php
namespace app\admin\controller;
use think\Controller;
use think\Session;
use app\model\Admins;

class Login extends Controller
{


    public function getLogin()
    {
        return view('login/login');
    }

    //处理登陆
    public function postDologin()
    {
        if($_POST){

            $user=Admins::where('username',$_POST['username'])->where('status',1)->find();

            if(!$user){
                $user1=Admins::where('phone',$_POST['username'])->where('status',1)->find();
                if($user1){
                    if($user1->password == md5($_POST['password'])){
                        Session::set('admin_id',$user1->id);
                        Session::set('admin_username',$user1->username);
                        $this->success('登陆成功', '/admin/index/index');
                    }else{
                        $this->error('账号或密码错误！');
                    }
                }else{
                    $this->error('账号或密码错误！');
                }  
            }else{
                if($user->password == md5($_POST['password'])){
                    Session::set('admin_id',$user->id);
                    Session::set('admin_username',$user->username);
                    $this->success('登陆成功', '/admin/index/index');
                }else{
                    $this->error('账号或密码错误！');
                }
            }
            
        }else{
            $this->error('账号或密码错误！');
        }
    }


    //富文本编译器上传图片
    public function postUploadimg()
    {
        $data = [
            'success'   => false,
            'msg'       => '上传失败!',
            'file_path' => ''
        ];
        // 获取表单上传文件  
        $file = request()->file('upload_file');  
        if(!empty($file)) {  
             // 移动到框架应用根目录/public/uploads/ 目录下  
            $info = $file->move(ROOT_PATH.'public'.DS.'upload'); 
            if($info){
                $data['file_path'] = '/upload/'.date('Ymd',time()).'/'.$info->getFilename();
                $data['msg']       = "上传成功!";
                $data['success']   = true;
            }
        }  
           
        return $data;
            
    }

}
