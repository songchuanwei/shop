<?php
namespace app\index\controller;
use think\Controller;
use think\Request;
use think\Session;
use app\model\Users;
use app\model\Goods;
use app\model\GoodTypes;
use app\model\Comments;
use app\model\UserGoods;
use app\model\Orders;
use app\model\OrderGoods;
use app\model\Addresss;

class Good extends Base
{
    //商品列表
    public function getIndex()
    {
        $data=[['type'=>'create_time','name'=>'发布时间'],['type'=>'price','name'=>'价格'],['type'=>'a_price','name'=>'促销价格'],['type'=>'stock','name'=>'库存']];
        $title=input('title')?input('title'):'';
        $type=input('type')?input('type'):'create_time';
        $goods=Goods::where('status',1)->where(function($query){
            if(input('good_type_id')){
                 $query->where('good_type_id',input('good_type_id'));
            }   
            if(input('title')){
                 $query->where('name','like','%'.input('title').'%');
            }      
        })->order($type,'desc')->paginate(6);

        $goodtypes=GoodTypes::where('status',1)->order('create_time','desc')->limit(6)->select();

        //促销商品
        $maps['a_price'] = ['>', "price"];
        $goods1=Goods::where('a_price','<>',0)->where($maps)->limit(3)->select();

        return view('good/index',compact('goods','title','goodtypes','type','data','goods1'));
    }



    //商品类型列表
    public function getGoodtype()
    {
        
        $goodtypes=GoodTypes::order('create_time','desc')->where('status',1)->select();

        if(input('good_type_id')){
            $goods=Goods::where('status',1)->where('good_type_id',input('good_type_id'))->order('create_time','desc')->select();
        }else{
            $goods=$goodtypes[0]->goods()->select();
        }

        

        return view('good/goodtype',compact('goodtypes','goods'));
    }


    //购物车
    public function getGoodcart()
    {
        homeLogin();
        $user=Users::find(session('id'));
        $addresss=$user->addresss()->where('status',1)->select();

        return view('good/goodcart',compact('user','addresss'));
    }


    //提交订单
    public function postOrder()
    {
        $user=Users::find(session('id'));

        //添加订单表
        $data['order_num']=date('YmdHis');
        $data['user_id']=$user->id;
        $data['address_id']=input('address_id');
        $data['price']=input('price');
        $data['is_pay']=0;
        $data['pay_time']=date('Y-m-d H:i:s',time());
        $data['is_ship']=0;
        $data['ship_time']=date('Y-m-d H:i:s',time());
        $data['status']=1;
        $data['create_time']=date('Y-m-d H:i:s',time());
        //增加订单
        $order = Orders::create($data);
        if(!$order){
            return ['error'=>1,'msg'=>'提交订单成功'];
        }

        foreach (json_decode(input('goods'), true) as $k => $v) {
            $data1['order_id']=$order->id;
            $data1['good_id']=$v['id'];
            $data1['num']=$v['num'];
            $data1['status']=1;
            $data1['create_time']=date('Y-m-d H:i:s',time());

            //增加订单商品表
            $ordergood = OrderGoods::create($data1);
            if(!$ordergood){
                return ['error'=>1,'msg'=>'提交订单商品失败'];
            }else{

                //删除购物车表
                $usergood=UserGoods::where('user_id',$user->id)->where('good_id',$v['id'])->find();

                //修改商品表库存
                $good=Goods::find($v['id']);
                if($usergood['num']!=$v['num']){
                    $good->stock=$good->stock+($usergood['num']-$v['num']);
                    if(!$good->save()){
                        return ['error'=>1,'msg'=>'改变商品库存失败'];
                    }
                }

                if(!$usergood->delete()){
                    return ['error'=>1,'msg'=>'删除购物车失败'];
                }

            }
        }
        
        return ['error'=>0,'order_id'=>$order->id,'msg'=>'提交订单成功'];
        
    }


    //付款
    public function getPay()
    {
        $user=Users::find(session('id'));

        $order = Orders::find(input('order_id'));

        //判断余额
        if($user->money<$order->price){
            return ['error'=>1,'msg'=>'余额不足，请联系管理员'];
        }

        $user->money=$user->money-$order->price;
        if(!$user->save()){
            return ['error'=>1,'msg'=>'减余额失败'];
        }else{
            $order->is_pay=1;
            $data['pay_time']=date('Y-m-d H:i:s',time());
            if($order->save()){
                return ['error'=>0,'msg'=>'付款成功'];
            }else{
                return ['error'=>1,'msg'=>'修改订单状态失败'];
            }
        }
        
    }


    //删除购物车商品
    public function getGoodcartdel()
    {
        $usergood=UserGoods::find(input('id'));

        $good=Goods::find($usergood->good_id);
        $good->stock=$good->stock+$usergood->num;
        //改变库存
        if($good->save()){

            //删除购物车
            if($usergood->delete()){
                return ['error'=>0,'msg'=>'删除成功'];
            }else{
                return ['error'=>1,'msg'=>'删除失败'];
            }
            
        }else{
            return ['error'=>1,'msg'=>'改变商品库存失败'];
        }


    }


    //商品详情
    public function getShow()
    {
        $user=Users::where('username',session('username'))->find();


        $good=Goods::where('id',input('id'))->where('status',1)->find();

        if(!$good){
            $this->error('传参错误');
        }
        return view('good/show',compact('good','user'));
    }


    //加入购物车
    public function getCart(){

        $good=Goods::find(input('good_id'));
        if($good->stock<input('num')){
            return ['error'=>1,'msg'=>'库存不足'];
        }

        $usergood=UserGoods::where('user_id',session('id'))->where('good_id',input('good_id'))->where('type',1)->find();
        if($usergood){
            $usergood->num += input('num');
            $usergood1=$usergood->save();

        }else{
            $usergood1 = UserGoods::create([
                'user_id'=>session('id'),
                'good_id'=>input('good_id'),
                'num'=>input('num'),
                'type' =>  1,
                'status' =>  1,
                'create_time'=>date('Y-m-d H:i:s'),
            ]);
        }

        if($usergood1){
            $good->stock=$good->stock-input('num');
            if($good->save()){
                return ['error'=>0,'msg'=>'加入购物车成功'];
            }else{
                return ['error'=>1,'msg'=>'加入购物车成功，减库存失败'];
            }
            
        }else{
            return ['error'=>1,'msg'=>'加入购物车失败'];
        }

    }




    //喜欢
    public function getLovecart()
    {
        homeLogin();
        $user=Users::find(session('id'));

        return view('good/lovecart',compact('user'));
    }

    //对比
    public function getComparecart()
    {
        homeLogin();
        $user=Users::find(session('id'));

        return view('good/comparecart',compact('user'));
    }

    //加入对比/喜欢
    public function getLove()
    {
        $user=Users::where('username',session('username'))->find();
        if(input('type')==1){
            $data['user_id']=$user->id;
            $data['good_id']=input('good_id');
            $data['num']=0;
            $data['status']=1;
            $data['type']=input('num');
            $data['create_time']=date('Y-m-d H:i:s',time());
 
            if(input('num')==3 && $user->compares()->count()>=3){
                return ['error'=>1,'msg'=>'最多添加三个对比，请删除后再操作'];
            }

            if(UserGoods::create($data)){
                return ['error'=>0,'msg'=>'操作成功'];
            }else{
                return ['error'=>1,'msg'=>'操作失败'];
            }
        }else{
            if(input('type')==2){
                $usergood=UserGoods::where('user_id',session('id'))->where('good_id',input('good_id'))->where('type',input('num'))->delete();

                if($usergood){
                     return ['error'=>0,'msg'=>'操作成功'];
                }else{
                    return ['error'=>1,'msg'=>'操作失败'];
                }
            }else{
                return ['error'=>1,'msg'=>'参数错误'];
            }
        }
        
    }


      //评论
    public function postComment(){

        $comment = Comments::create([
            'user_id'=>session('id'),
            'good_id'=>input('good_id'),
            'grade'=>input('grade'),
            'content' =>  input('content'),
            'status' =>  1,
            'create_time'=>date('Y-m-d H:i:s'),
        ]);

        if($comment){
            return ['error'=>0,'msg'=>'评论成功'];
        }else{
            return ['error'=>1,'msg'=>'评论失败'];
        }

    }





}
