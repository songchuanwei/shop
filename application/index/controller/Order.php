<?php
namespace app\index\controller;
use think\Controller;
use app\model\Users;
use app\model\Orders;

class Order extends Base
{
    //删除未支付订单
    public function getDel()
    {
        
        $order=Orders::find(input('id'));

        foreach ($order->goods()->select() as $good) {
            $good->stock=$good->stock+$good->pivot->num;
            //改变库存
            if(!$good->save()){
                return ['error'=>1,'msg'=>'改变商品库存失败'];
            }
        }
        
        //删除订单
        if($order->delete()){
            return ['error'=>0,'msg'=>'删除订单成功'];
        }else{
            return ['error'=>1,'msg'=>'删除订单失败'];
        }

    }


    //收货
    public function getShip()
    {
        
        $order=Orders::find(input('id'));
        $order->is_ship=2;
        $order->ship_time=date('Y-m-d H:i:s',time());
        //删除订单
        if($order->save()){
            return ['error'=>0,'msg'=>'收货成功'];
        }else{
            return ['error'=>1,'msg'=>'收货失败'];
        }

    }



    

}
