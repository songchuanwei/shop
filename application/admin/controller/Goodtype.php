<?php
namespace app\admin\controller;
use think\Controller;
use think\Session;
use app\model\GoodTypes;

class Goodtype extends Base
{
	//用户列表
    public function getIndex()
    {
        $goodtypes=GoodTypes::order('create_time')->select();
        return view('goodtype/index',compact('goodtypes'));
    }

    //添加用户
    public function getAdd()
    {
        return view('goodtype/add');
    }
    //处理添加用户
    public function postDoadd()
    {
        $goodtype = GoodTypes::create([
		    'name'  =>  input('name'),
            'status' =>  1,
		    'create_time'=>date('Y-m-d H:i:s')
		]);

		if($goodtype){
			return ['error'=>0,'msg'=>'商品类型添加成功'];
		}else{
			return ['error'=>1,'msg'=>'商品类型添加失败'];
		}
    }

    //编辑用户
    public function getEdit()
    {
        $goodtype=GoodTypes::find(input('id'));
        return view('goodtype/edit',compact('goodtype'));
    }
    //处理编辑用户
    public function postDoedit() 
    {
        $goodtype=GoodTypes::find(input('id'));
        $goodtype->name=input('name');

        if($goodtype->save()){
            return ['error'=>0,'msg'=>'商品类型修改成功'];
        }else{
            return ['error'=>1,'msg'=>'商品类型修改失败'];
        }
    }

    //修改状态
    public function getStatus()
    {
        $goodtype=GoodTypes::find(input('id'));
        $goodtype->status=input('status');
        if($goodtype->save()){
            return ['error'=>0,'msg'=>'修改状态成功'];
        }else{
            return ['error'=>1,'msg'=>'修改状态失败'];
        }
    }
    


}
