
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
layui.define(['layer'],function(exports){
    "use strict";
	var $ = layui.jquery,
	    layer = layui.layer;
       
	var CmsCommon = {
        /**
         * 抛出异常错误信息
         * @param {String} msg
         */
        cmsError: function(msg,title){
			parent.layer.alert(msg, {
				title: title,
				icon: 2,
				time: 0,
				resize: false,
				zIndex: layer.zIndex,
				anim: Math.ceil(Math.random() * 6)
			});
			return;
        },
        cmsInfo: function(msg,title){
            parent.layer.alert(msg, {
                title: title,
                icon: 6,
                time: 0,
                resize: false,
                zIndex: layer.zIndex,
                anim: Math.ceil(Math.random() * 6)
            });
            return;
        },
        cmsConfirm: function(){

        },
        //退出系统
        logOut: function (title, text, url,type, dataType, data, callback) {
            parent.layer.confirm(text, {
                title: title,
                resize: false,
                btn: ['确定退出系统', '不，我点错了！'],
                btnAlign: 'c',
                icon: 3

            }, function () {

			location.href = url;
            }, function () {
                layer.msg('返回系统', {
                    time: 1500,
                    btnAlign: 'c',
                    btn: ['OK']
                });
            });
        }

	};

	exports('common',CmsCommon);
})