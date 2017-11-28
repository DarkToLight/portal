
/*
* @Author: 梁大波
* @Date:   2017-11-16 17:20:54
* @Last Modified by:   fyrz
* @Last Modified time: 2017-12-20 11:16:07
* +----------------------------------------------------------------------
* | 泛亚认证1.0 [ 泛亚.AD广告投放系统 ]
* | 贵州泛亚信通网络科技有限公司版权所有 | Copyright © 2004-2016 www.fyxtw.com All Rights Reserved. |
* | Licensed ( www.fyxtw.com )
* | Author: 梁大波 <dtypt@outlook.com>
* +----------------------------------------------------------------------
*/
layui.use(['jquery','layer','form'],function(){
   'use strict';
	var $ = layui.jquery
	   ,layer=layui.layer
	   ,form =layui.form();
    
    $(window).on('resize',function(){
        var w = $(window).width();
        var h = $(window).height();
        $('.larry-canvas').width(w).height(h);
    }).resize();
    
    //登录链接测试，使用时可删除
    $(".submit_btn").click(function(){
      location.href="index.html";
    });
    $(function(){
        $("#canvas").jParticle({
            background: "#141414",
            color: "#E5E5E5"
        });
    });
//监听提交
    //form.on('submit(submit_btn)', function(data){

     //layer.msg("账户或者密码错误，请重新输入");
        /*
        layer.alert(JSON.stringify(data.field), {
            title: '最终的提交信息'
        })
        return false;
        */
  //  });
    //向世界问个好
    //layer.msg('Hello World');
});
/*
$(".submit_btn").on("click", function(){
        var data = $('.layui-form').serializeArray();
        $.ajax({
            type: "post",
            url: "http://portal.cn/index.php/Home/index/postLogin",
            data: data,
            dataType: "text",
            success: function(data){
				return false;
            }
        });
	});
*/


