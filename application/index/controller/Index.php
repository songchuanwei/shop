<?php
namespace app\index\controller;
use think\Controller;
use think\Session;
use app\model\Users;
use app\model\Admins;
use app\model\Goods;
use app\model\GoodTypes;
use app\model\Blogs;
use app\model\Services;

class Index extends Base
{
    //前台首页
    public function getIndex()
    {
        $admin1=Admins::where('status',1)->order('create_time','desc')->limit(2)->select();    //第一店铺
        $good1=Goods::where('status',1)->order('create_time','desc')->limit(4)->select();    //第一商品

        $maps['a_price'] = ['>', "price"];
        $good2=Goods::where('a_price','<>',0)->where($maps)->where('status',1)->limit(16)->select(); //第二促销商品

        $goodtype1=GoodTypes::order('create_time','desc')->where('status',1)->limit(3)->select();//商品类型


        $blog1=Blogs::where('status',1)->order('create_time','desc')->limit(3)->select();//公告


        return view('index/index',compact('admin1','good1','good2','goodtype1','blog1'));
    }


    //店铺列表
    public function getAdmins()
    {
        $title=input('title')?input('title'):'';

        $admins=Admins::where('status',1)->where(function($query){ 
            if(input('title')){
                 $query->where('name','like','%'.input('title').'%')->whereOr('content','like','%'.input('title').'%');
            }      
        })->order('create_time','desc')->paginate(4);

        $goodtypes=GoodTypes::where('status',1)->order('create_time','desc')->limit(6)->select();

        //促销商品
        $maps['a_price'] = ['>', "price"];
        $goods1=Goods::where('a_price','<>',0)->where($maps)->limit(3)->select();

        return view('index/admins',compact('admins','goods1','goodtypes','title'));
    }

    //店铺信息
    public function getAdminshow()
    {

        $admin=Admins::find(input('id'));

        $goods=Goods::where('admin_id',$admin->id)->limit(2)->select();

        return view('index/adminshow',compact('admin','goods'));
    }


    //客服
    public function getService()
    {
        homeLogin();
        $admin=Admins::find(input('id'));

        if(!$admin){
            $this->error('参数错误');
        }
        
        return view('index/service',compact('admin'));
    }


    //处理客服回复消息
    public function postDoservice()
    {
       $service = Services::create([
            'user_id'=>session('id'),
            'admin_id'=>input('admin_id'),
            'content' =>  input('content'),
            'type' =>  1,
            'create_time'=>date('Y-m-d H:i:s'),
        ]);

        if($service){
            return ['error'=>0,'msg'=>'回复成功'];
        }else{
            return ['error'=>1,'msg'=>'回复失败'];
        }

    }


    //个人中心
    public function getMy()
    {
        homeLogin();
        $user=Users::find(session('id'));

        return view('index/my',compact('user'));
    }

    

}
