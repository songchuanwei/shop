<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
//前台登陆auth
if ( !function_exists('homeLogin') ) {
    function homeLogin()
    {
        if(!session('username')){
        	echo '<script>alert("请先登录"); window.location.href="/login/login";</script>';
            die;
        }
    }
}

//前台登陆auth
if ( !function_exists('homeLogout') ) {
    function homeLogout()
    {
        if(session('username')){
        	echo '<script>alert("您以登陆"); history.back(-1);</script>';
            die;
        }
    }
}


//截取字符串 大于一个值用...代替
if ( !function_exists('setStr') ) {
    function setStr($str,$num)
    {
        return strlen($str)>$num?mb_substr($str,0,$num).'...':$str;
    }
}


//时间转换 2019-03-01 09：01：30 ->03-01 09：01
if ( !function_exists('setDate') ) {
    function setDate($str)
    {
        return date('m-d H:i',strtotime($str));
    }
}

//截取字符串逗号前第一个
if ( !function_exists('setImg') ) {
    function setImg($str,$num=1)
    {
        $data=explode(",", $str);

            if($num==1){
                return $data[0];
            }else{
                if(count($data)>=2){
                    return $data[1];
                }else{
                    return $data[0];
                }
            }
        
    }
}

//截取字符串逗号前第一个
if ( !function_exists('setImgs') ) {
    function setImgs($str)
    {
        $data=[];
        foreach (explode(",", $str) as $k=>$v) {
            if($k<count(explode(",", $str))-1){
                $data[$k]=$v;
            }
        }
        return $data;
    }
}