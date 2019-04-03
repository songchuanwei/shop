<?php
namespace app\admin\controller;
use think\Controller;
use think\Session;
use app\model\Orders;
use app\model\Admins;
use think\Request;

class Order extends Base
{
	//订单列表
    public function getIndex()
    {
        $admin=Admins::find(session('admin_id'));

        $orders=Orders::order('create_time')->select();

        return view('order/index',compact('orders','admin'));
    }


    //订单详情
    public function getShow()
    {
        $order=Orders::find(input('id'));
        return view('order/show',compact('order'));
    }


    //发货
    public function getShip()
    {
        $order=Orders::find(input('id'));

        $order->is_ship=1;
        
        if($order->save()){
            return ['error'=>0,'msg'=>'发货成功'];
        }else{
            return ['error'=>1,'msg'=>'发货失败'];
        }
    }


    //删除订单
    public function getDel()
    {
        $order=Orders::find(input('id'));

        if($order->is_pay==0){
            foreach ($order->goods()->select() as $good) {
                $good->stock=$good->stock+$good->pivot->num;
                //改变库存
                if(!$good->save()){
                    return ['error'=>1,'msg'=>'改变商品库存失败'];
                }
            }
        }

        if($order->delete()){
            return ['error'=>0,'msg'=>'订单删除成功'];
        }else{
            return ['error'=>1,'msg'=>'订单删除失败'];
        }
    }
    

}
