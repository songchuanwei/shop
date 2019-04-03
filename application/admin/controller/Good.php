<?php
namespace app\admin\controller;
use think\Controller;
use think\Session;
use app\model\Goods;
use app\model\GoodTypes;
use app\model\Admins;
use think\Request;

class Good extends Base
{
	//商品列表
    public function getIndex()
    {
        $user=Admins::find(session('admin_id'));
        if($user->type==1){
            $goods=Goods::order('create_time')->select();
        }else{
            $goods=Goods::where('admin_id',$user->id)->order('create_time')->select();
        }
        return view('good/index',compact('goods','user'));
    }

    //添加商品
    public function getAdd()
    {
        $goodtypes=GoodTypes::where('status',1)->select();
        return view('good/add',compact('goodtypes'));
    }
    //处理添加商品
    public function postDoadd()
    {
        $data=array();
        $data['imgs']='';
        $files = request()->file('imgs');
        if($files) { 
             // 获取表单上传文件  
            foreach($files as $file){
                // 移动到框架应用根目录/public/uploads/ 目录下  
                $info = $file->move(ROOT_PATH.'public'.DS.'upload'); 
                if($info){
                    $data['imgs'] .= '/upload/'.date('Ymd',time()).'/'.$info->getFilename().',';
                }else{
                    return ['error'=>1,'msg'=>'上传头像失败'];
                }
            }    
        }else{
            return ['error'=>1,'msg'=>'请上传头像'];
        } 

        $data['name']=input('name');
        $data['admin_id']=session('admin_id');
        $data['good_type_id']=input('good_type_id');
        $data['price']=input('price');
        $data['a_price']=input('a_price');
        $data['stock']=input('stock');
        $data['content']=input('content');
        $data['status']=1;
        $data['create_time']=date('Y-m-d H:i:s');

        $good = Goods::create($data);

		if($good){
			return ['error'=>0,'msg'=>'公告添加成功'];
		}else{
			return ['error'=>1,'msg'=>'公告添加失败'];
		}
    }

    //编辑商品
    public function getEdit()
    {
        $goodtypes=GoodTypes::where('status',1)->select();
        $good=Goods::find(input('id'));
        return view('good/edit',compact('good','goodtypes'));
    }
    //处理编辑商品
    public function postDoedit() 
    {
        $good=Goods::find(input('id'));

        $files = request()->file('imgs');
        if($files) {  
            $good->imgs='';
             // 获取表单上传文件  
            foreach($files as $file){
                // 移动到框架应用根目录/public/uploads/ 目录下  
                $info = $file->move(ROOT_PATH.'public'.DS.'upload'); 
                if($info){
                    $good->imgs .= '/upload/'.date('Ymd',time()).'/'.$info->getFilename().',';
                }else{
                    return ['error'=>1,'msg'=>'上传头像失败'];
                }
            }
        }  

        $good->name=input('name');
        $good->good_type_id=input('good_type_id');
        $good->price=input('price');
        $good->a_price=input('a_price');
        $good->stock=input('stock');
        $good->content=input('content');

        if($good->save()){
            return ['error'=>0,'msg'=>'商品修改成功'];
        }else{
            return ['error'=>1,'msg'=>'商品修改失败'];
        }
    }


    //商品详情
    public function getShow()
    {
        $good=Goods::find(input('id'));
        return view('good/show',compact('good'));
    }

    //修改状态
    public function getStatus()
    {
        $good=Goods::find(input('id'));
        $good->status=input('status');
        if($good->save()){
            return ['error'=>0,'msg'=>'修改状态成功'];
        }else{
            return ['error'=>1,'msg'=>'修改状态失败'];
        }
    }
    

}
