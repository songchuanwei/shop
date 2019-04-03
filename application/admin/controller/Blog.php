<?php
namespace app\admin\controller;
use think\Controller;
use think\Session;
use app\model\Blogs;

class Blog extends Base
{
	//公告列表
    public function getIndex()
    {
        $blogs=Blogs::order('create_time')->select();
        return view('blog/index',compact('blogs'));
    }

    //添加公告
    public function getAdd()
    {
        return view('blog/add');
    }
    //处理添加公告
    public function postDoadd()
    {
        $blog = Blogs::create([
		    'title'  =>  input('title'),
		    'content' =>  input('content'),
		    'create_time'=>date('Y-m-d H:i:s')
		]);

		if($blog){
			return ['error'=>0,'msg'=>'公告添加成功'];
		}else{
			return ['error'=>1,'msg'=>'公告添加失败'];
		}
    }

    //编辑公告
    public function getEdit()
    {
        $blog=Blogs::find(input('id'));
        return view('blog/edit',compact('blog'));
    }
    //处理编辑公告
    public function postDoedit() 
    {
        $blog=Blogs::find(input('id'));
        $blog->title=input('title');
        $blog->content=input('content');

        if($blog->save()){
            return ['error'=>0,'msg'=>'公告修改成功'];
        }else{
            return ['error'=>1,'msg'=>'公告修改失败'];
        }
    }

    //删除公告
    public function getDel()
    {
        $blog=Blogs::find(input('id'));
        if($blog->delete()){
            return ['error'=>0,'msg'=>'公告删除成功'];
        }else{
            return ['error'=>1,'msg'=>'公告删除失败'];
        }
    }
    

}
