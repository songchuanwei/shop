<?php
namespace app\index\controller;
use think\Controller;
use app\model\Users;
use app\model\Blogs;
use app\model\GoodTypes;
use app\model\Goods;


class Blog extends Baseleft
{
    
    //公告列表
    public function getIndex(){

        $title=input('title')?input('title'):'';

        $blogs=Blogs::where(function($query){ 
            if(input('title')){
                 $query->where('title','like','%'.input('title').'%')->whereOr('content','like','%'.input('title').'%');
            }      
        })->order('create_time','desc')->paginate(1);

        return view('blog/index',compact('blogs','title'));
    }

    //公告详情
    public function getShow(){

        $blog=Blogs::find(input('id'));


        return view('blog/show',compact('blog'));
    }


}
