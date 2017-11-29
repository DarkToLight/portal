
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
var navtab;
layui.config({
    base: '/Public/home/js/lib/' //layui自定义layui组件目录
}).extend({
    larry: 'larry',
    navtab: 'navtab',
    elemnts: 'elements',
    common: 'common',
});
layui.use(['elements', 'jquery', 'layer', 'larry', 'navtab', 'form', 'common'], function () {
    var $ = layui.jquery,
        layer = layui.layer,
        device = layui.device(),
        elements = layui.elements(),
        larry = layui.larry(),
        form = layui.form(),
        common = layui.common;
        navtab = layui.navtab({
        elem: '#larry-tab'
    });

    // 页面禁止双击选中
    $('body').bind("selectstart", function () {
        return false;
    });

    $(document).ready(function () {
        // 浏览器兼容检
        if (device.ie && device.ie < 9) {
            layer.alert('最低支持ie9，您当前使用的是古老的 IE' + device.ie + '！');
        }
        // 001界面初始化
        AdminInit();
        //绑定导航数据
        /*$.ajaxSettings.async = false;
        $.getJSON('../backstage/datas/top_menu.json?t=' + new Date(), {
            Param: 'index_menu'
        }, function (result) {
            larry.set({
                elem: '#menu',
                data: result,
                cached: false
            });
            larry.render();
        });*/

		var result = [

			{
			"title": "",
			"icon": "",
			"pid": "0",
			},{
                "title": "",
                "icon": "",
                "pid": "10",
                "href": ""
            },{
			"title": "",
			"icon": "",
			"pid": "20"
		  },{
			"title": "",
			"icon": "",
			"pid": "30"
		  },{
			"title": "",
			"icon": "",
			"pid": "40"
		  },{
				"title": "",
				"icon": "",
				"pid": "99"
		  }
		]
		larry.set({
			elem: '#menu',
			data: result,
			cached: false
		});
		larry.render();

        var $menu = $('#menu');

        $menu.find('li.layui-nav-item').each(function () {
            var $that = $(this);
            //绑定一级导航的点击事件
            $that.on('click', function () {
                var id = $that.data('pid');
                /*$.ajaxSettings.async = false;

                $.getJSON('../backstage/datas/pid_' + id + '.json?t=' + new Date(), {
                    pid: id,
                    Param: 'index_menu'
                }, function (result) {
                    larry.set({
                        elem: '#larrySideNav',
                        data: result,
                        spreadOne: true
                    });
                    larry.render();
                    //监听左侧导航点击事件
                    larry.on('click(side)', function (data) {
                        navtab.tabAdd(data.field);
                    });
                });*/

                var pid_0 = [{
    			    "pid": "100",
    			    "title": "后台首页",
    			    "icon": "larry-houtaishouye",
    			    
    			    "href": "../index/main.html"
    			}, {
    			    "pid": "101",
                     "title": "用户管理",
                      "icon": "larry-gerenxinxi1",
                      "href": "../User/index.html"
    			},{
                    "pid": "102",
                        "title": "区域|场景管理",
                        "icon": "larry-iconguanggaoguanli",
                        "href": "../Area/index"
                },{
                        "pid": "103",
                        "title": "AP管理",
                        "icon": "larry-iconguanggaoguanli",
                        "href": "../Ap/index"
				},{
    			    "pid": "104",
    			    "title": "广告管理",
					"icon": "larry-iconguanggaoguanli",
					"href": "../Ad/index"

    			},
				/*{
    			    "pid": "104",
    			    "title": "统计分析",
    			    "icon": "larry-10103",
    			    "spread": "true",
    			    "children": [{
    			        "title": "当日数据",
    			        "icon": "larry-iconguanggaoguanli",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "历史数据",
    			        "icon": "larry-iconguanggaoguanli",
    			        "href": "./index.php/index/temp.html"
    			    }]
    			},
    			*/{
    			    "pid": "105",
    			    "title": "广告商管理",
					"icon": "larry-iconguanggaoguanli",
    			    "href": "../Business/index.html"
    			}
    			/*,{
    			    "pid": "106",
    			    "title": "系统设置",
    			    "icon": "larry-xitongshezhi1",
    			    "spread": "true",
    			    "children": [{
    			        "title": "系统基本参数",
    			        "icon": "larry-circularxiangxi",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "SQL命令行工具",
    			        "icon": "larry-sql2",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "系统日志管理",
    			        "icon": "larry-xitongrizhi1",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "验证安全管理",
    			        "icon": "larry-yanzheng",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "图片水印设置",
    			        "icon": "larry-shuiyin",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "安全字典设置",
    			        "icon": "larry-zidian",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "短信接口配置",
    			        "icon": "larry-duanxin1",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "系统错误修复",
    			        "icon": "larry-xiufu",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "数据库管理",
    			        "icon": "larry-sql1",
    			        "href": "./index.php/index/temp.html"
    			    }]
    			}, {
    			    "pid": "107",
    			    "title": "友链管理",
    			    "icon": "larry-a157",
    			    "href": "./index.php/index/temp.html"
    			}
    			*/];
                var pid_10 = [{
                    "pid": "101",
                    "title": "区域|场景管理",
                    "icon": "larry-iconguanggaoguanli",
                    "spread": "true",
                    "children": [{
                        "title": "查看",
                        "icon": "larry-iconguanggaoguanli",
                        "href": "./index.php/Area/index"
                    }, {
                        "title": "编辑",
                        "icon": "larry-iconguanggaoguanli",
                        "href": "./index.php/Area/index"
                    }, {
                        "title": "删除",
                        "icon": "larry-iconguanggaoguanli",
                        "href": "./index.php/Area/index"
                    }]
                },{
                    "pid": "102",
                    "title": "AP管理",
                    "icon": "larry-iconguanggaoguanli",
                    "spread": "true",
                    "children": [{
                        "title": "新增",
                        "icon": "larry-iconguanggaoguanli",
                        "href": "./index.php/Ap/index"
                    }, {
                        "title": "编辑",
                        "icon": "larry-iconguanggaoguanli",
                        "href": "./index.php/Ap/index"
                    }, {
                        "title": "删除",
                        "icon": "larry-iconguanggaoguanli",
                        "href": "./index.php/Ap/index"
                    }]
                }];
                var pid_20 = [{
    			    "pid": "201",
    			    "title": "订单管理",
    			    "icon": "larry-iconguanggaoguanli",
    			    "spread": "true",
    			    "children": [{
    			        "title": "查看订单",
    			        "icon": "larry-iconguanggaoguanli",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "新增订单",
    			        "icon": "larry-iconguanggaoguanli",
    			        "href": "./index.php/index/temp.html"
    			    }]
    			},{
                    "pid": "202",
                    "title": "默认广告",
                    "icon": "larry-iconguanggaoguanli",
                    "spread": "true",
                    "children": [{
                        "title": "查看广告",
                        "icon": "larry-iconguanggaoguanli",
                        "href": "./index.php/index/temp.html"
                    }, {
                        "title": "新增广告",
                        "icon": "larry-iconguanggaoguanli",
                        "href": "./index.php/index/temp.html"
                    }]
                },{
                    "pid": "203",
                    "title": "广告查询",
                    "icon": "larry-iconguanggaoguanli",
                    "spread": "true",
                    "children": [{
                        "title": "查看广告",
                        "icon": "larry-iconguanggaoguanli",
                        "href": "./index.php/index/temp.html"
                    }, {
                        "title": "预览广告",
                        "icon": "larry-iconguanggaoguanli",
                        "href": "./index.php/index/temp.html"
                    }]
                }
    			];
                var pid_30 = [{
    			    "pid": "301",
    			    "title": "当日数据",
    			    "icon": "larry-10103",
    			    "spread": "true",
    			    "children": [{
    			        "title": "订单数据",
    			        "icon": "larry-iconguanggaoguanli",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "广告数据",
    			        "icon": "larry-iconguanggaoguanli",
    			        "href": "./index.php/index/temp.html"
    			    }]
    			},{
                    "pid": "302",
                        "title": "历史数据",
                        "icon": "larry-10103",
                        "spread": "true",
                        "children": [{
                        "title": "订单数据",
                        "icon": "larry-iconguanggaoguanli",
                        "href": "./index.php/index/temp.html"
                    }, {
                        "title": "广告数据",
                        "icon": "larry-iconguanggaoguanli",
                        "href": "./index.php/index/temp.html"
                    }]
                }]

                var pid_40 = [{
    			    "pid": "401",
    			    "title": "广告商维护",
    			    "icon": "larry-10103",
    			    "spread": "true",
    			    "children": [{
    			        "title": "查询广告商",
    			        "icon": "larry-iconguanggaoguanli",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "编辑广告商",
    			        "icon": "larry-iconguanggaoguanli",
    			        "href": "./index.php/index/temp.html"
    			    }]
    			},{
                    "pid": "402",
                    "title": "新建广告商",
                    "icon": "larry-10103",
                    "spread": "true",
                    "children": [{
                        "title": "新增广告商",
                        "icon": "larry-iconguanggaoguanli",
                        "href": "./index.php/index/temp.html"
                    }, {
                        "title": "查看广告商",
                        "icon": "larry-iconguanggaoguanli",
                        "href": "./index.php/index/temp.html"
                    },{
                        "title": "删除广告商",
                        "icon": "larry-iconguanggaoguanli",
                        "href": "./index.php/index/temp.html"
                    }]
                }];

    			var pid_99 = [{
    			    "pid": "991",
    			    "title": "系统设置",
    			    "icon": "larry-xitongshezhi1",
    			    "spread": "true",
    			    "children": [{
    			        "title": "系统基本参数",
    			        "icon": "larry-circularxiangxi",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "SQL命令行工具",
    			        "icon": "larry-sql2",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "系统日志管理",
    			        "icon": "larry-xitongrizhi1",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "验证安全管理",
    			        "icon": "larry-yanzheng",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "图片水印设置",
    			        "icon": "larry-shuiyin",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "安全字典设置",
    			        "icon": "larry-zidian",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "短信接口配置",
    			        "icon": "larry-duanxin1",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "系统错误修复",
    			        "icon": "larry-xiufu",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "数据库管理",
    			        "icon": "larry-sql1",
    			        "href": "./index.php/index/temp.html"
    			    }]
    			},{
    				"pid": "992",
    			    "title": "网站管理",
    			    "icon": "larry-30wangzhanguanli",
    			    "spread": "true",
    			    "children": [{
    			        "title": "网站栏目管理",
    			        "icon": "larry-lanmuguanli",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "所有文章列表",
    			        "icon": "larry-iconfontfilesfill",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "待审核的文章",
    			        "icon": "larry-daishenhe1",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "我发布的文章",
    			        "icon": "larry-fabu2",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "Tags管理",
    			        "icon": "larry-tags",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "内容回收站",
    			        "icon": "larry-iconfonthuishouzhan",
    			        "href": "./index.php/index/temp.html"
    			    }]
    			}, {
    				"pid": "993",
    			    "title": "模型管理",
    			    "icon": "larry-moxingguanli",
    			    "spread": "true",
    			    "children": [{
    			        "title": "内容模型管理",
    			        "icon": "larry-moxing1",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "单页文档管理",
    			        "icon": "larry-danye",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "联动类别管理",
    			        "icon": "larry-liandong",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "自由列表管理",
    			        "icon": "larry-zidingyicaidan1",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "自定义表单",
    			        "icon": "larry-iconzidingyibiaodan",
    			        "href": "./index.php/index/temp.html"
    			    }]
    			}, {
    				"pid": "994",
    			    "title": "附件管理",
    			    "icon": "larry-fujianguanli",
    			    "spread": "true",
    			    "children": [{
    			        "title": "上传新文件",
    			        "icon": "larry-shangchuanfujian",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "附件数据管理",
    			        "icon": "larry-fujian",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "文件管理器",
    			        "icon": "larry-wenjianguanli2",
    			        "href": "./index.php/index/temp.html"
    			    }]
    			}, {
    				"pid": "995",
    			    "title": "采集管理",
    			    "icon": "larry-eee",
    			    "spread": "true",
    			    "children": [{
    			        "title": "采集节点管理",
    			        "icon": "larry-shujucaiji",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "临时内容管理",
    			        "icon": "larry-linshi1",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "导入采集规则",
    			        "icon": "larry-guize",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "监控采集模式",
    			        "icon": "larry-jiankong1",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "采集未下载内容",
    			        "icon": "larry-xiazai2",
    			        "href": "./index.php/index/temp.html"
    			    }]
    			},{
    				"pid": "996",
    			    "title": "批量维护",
    			    "icon": "larry-piliang",
    			    "spread": "true",
    			    "children": [{
    			        "title": "一键更新网站",
    			        "icon": "larry-yijian",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "更新系统缓存",
    			        "icon": "larry-xitonghuancun",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "更新主页HTML",
    			        "icon": "larry-tubiaozitimoban",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "更新栏目HTML",
    			        "icon": "larry-lanmu1",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "更新文档HTML",
    			        "icon": "larry-wendang",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "更新网站地图",
    			        "icon": "larry-wangzhanditu",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "重复文档检测",
    			        "icon": "larry-zhongfu",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "数据库内容替换",
    			        "icon": "larry-tihuan1",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "自动摘要",
    			        "icon": "larry-zhaiyao",
    			        "href": "./index.php/index/temp.html"
    			    }, {
    			        "title": "搜索关键词维护",
    			        "icon": "larry-guanjianci",
    			        "href": "./index.php/index/temp.html"
    			    },{
        			    "pid": "997",
        			    "title": "友链管理",
        			    "icon": "larry-a157",
        			    "href": "./index.php/index/temp.html"
        			}]
    			}]
    			

				var result;
				if(id == 0)
					result = pid_0;
				if(id == 1)
					result = pid_1;
				if(id == 2)
					result = pid_2;
				if(id == 10)
					result = pid_10;
				if(id == 20)
					result = pid_20;
				if(id == 30)
					result = pid_30;
				if(id == 40)
					result = pid_40;
				if(id == 50)
					result = pid_50;
				if(id == 60)
					result = pid_60;
				if(id == 70)
					result = pid_70;
				if(id == 80)
					result = pid_80;
				if(id == 90)
					result = pid_90;
				if(id == 99)
					result = pid_99;

				larry.set({
					elem: '#larrySideNav',
					data: result,
					spreadOne: true
				});
				larry.render();
				//监听左侧导航点击事件
				larry.on('click(side)', function (data) {
					navtab.tabAdd(data.field);
				});

            });

        });
        // 左侧导航点击事件
        $menu.find('li[data-pid=0]').click();
        $("#larrySideNav").find("li").eq(0).addClass('layui-this');
        $.ajaxSettings.async = true;


    });

    $('#larry-tab').bind("contextmenu", function () {
        return false;
    });

    // 常用操作
    $('#buttonRCtrl').find('dd').each(function () {
        $(this).on('click', function () {
            var eName = $(this).children('a').attr('data-eName');
            navtab.tabCtrl(eName);
        });
    });
    // 窗口自适应    
    $(window).on('resize', function () {
        AdminInit();
        // iframe窗口自适应
        var $content = $('#larry-tab .layui-tab-content');
        $content.height($(this).height() - 153);
        $content.find('iframe').each(function () {
            $(this).height($content.height());
        });
    }).resize();

    // 刷新iframe
    $("#refresh_iframe").click(function () {
        $(".layui-tab-content .layui-tab-item").each(function () {
            if ($(this).hasClass('layui-show')) {
                $(this).children('iframe')[0].contentWindow.location.reload(true);
            }
        });
    });

    function AdminInit() {
        $('.layui-layout-admin').height($(window).height());
        $('body').height($(window).height());
        $('#larry-body').width($('.layui-layout-admin').width() - $('#larry-side').width());
        $('#larry-footer').width($('.layui-layout-admin').width() - $('#larry-side').width());
    }

    //清除缓存
    $('#clearCached').on('click', function () {
        larry.cleanCached();
        layer.alert('缓存清除完成!本地存储数据也清理成功！', {icon: 1, title: '系统提示'}, function () {
            location.reload();//刷新
        });
    });

    // 设置主题
    var fScreen = localStorage.getItem("fullscreen_info");
    var themeName = localStorage.getItem('themeName');
    if (themeName) {
        $("body").attr("class", "");
        $("body").addClass("larryTheme-" + themeName);
    }
    if (fScreen && fScreen != 'false') {
        var fScreenIndex = layer.alert('按ESC退出全屏', {
            title: '进入全屏提示信息',
            skin: 'layui-layer-lan',
            closeBtn: 0,
            anim: 4,
            offset: '100px'
        }, function () {
            entryFullScreen();
            $('#FullScreen').html('<i class="larry-icon larry-quanping"></i>退出全屏');
            layer.close(fScreenIndex);
        });
    }
    $('#larryTheme').on('click', function () {
        var fScreen = localStorage.getItem('fullscreen_info');
        var themeName = localStorage.getItem('themeName');
        layer.open({
            type: 1,
            title: false,
            closeBtn: true,
            shadeClose: false,
            shade: 0.35,
            area: ['450px', '300px'],
            isOutAnim: true,
            resize: false,
            anim: Math.ceil(Math.random() * 6),
            content: $('#LarryThemeSet').html(),
            success: function (layero, index) {
                if (fScreen && fScreen != 'false') {
                    $("input[lay-filter='fullscreen']").attr("checked", "checked");
                }
                if (themeName) {
                    $("#themeName option[value='" + themeName + "']").attr("selected", "selected");
                }
                form.render();
            }
        });

        // 全屏开启
        form.on('switch(fullscreen)', function (data) {
            var fValue = data.elem.checked;
            localStorage.setItem('fullscreen_info', fValue); //fullscreen_info:fValue

        });
        // 主题设置
        form.on('select(larryTheme)', function (data) {
            var themeValue = data.value;
            localStorage.setItem('themeName', themeValue);//themeName:themeValue
            if (themeName) {
                $("body").attr("class", "");
                $("body").addClass("larryTheme-" + themeName);
            }
            form.render('select');
        });

        // form.on('submit(submitlocal)',function(data){

        // })
    });


    // 全屏切换
    $('#FullScreen').bind('click', function () {
        var fullscreenElement =
            document.fullscreenElement ||
            document.mozFullScreenElement ||
            document.webkitFullscreenElement;
        if (fullscreenElement == null) {
            entryFullScreen();
            $(this).html('<i class="larry-icon larry-quanping"></i>退出全屏');
        } else {
            exitFullScreen();
            $(this).html('<i class="larry-icon larry-quanping"></i>全屏');
        }
    });

    // 进入全屏：
    function entryFullScreen() {
        var docE = document.documentElement;
        if (docE.requestFullScreen) {
            docE.requestFullScreen();
        } else if (docE.mozRequestFullScreen) {
            docE.mozRequestFullScreen();
        } else if (docE.webkitRequestFullScreen) {
            docE.webkitRequestFullScreen();
        }
    }

    // 退出全屏
    function exitFullScreen() {
        var docE = document;
        if (docE.exitFullscreen) {
            docE.exitFullscreen();
        } else if (docE.mozCancelFullScreen) {
            docE.mozCancelFullScreen();
        } else if (docE.webkitCancelFullScreen) {
            docE.webkitCancelFullScreen();
        }
    }

    // 顶部左侧导航控制开关
    $('#toggle').click(function () {
        var sideWidth = $('#larry-side').width();
        var bodyW = $('#larry-body').width();
        if (sideWidth === 200) {
            bodyW += 203;
            $('#larry-body').animate({
                left: '0',
                width: bodyW
            });
            $('#larry-footer').animate({
                left: '0',
                width: bodyW
            });
            $('#larry-side').animate({
                width: '0'
            });
        } else {
            bodyW -= 203;
            $('#larry-body').animate({
                left: '203px',
                width: bodyW
            });
            $('#larry-footer').animate({
                left: '203px',
                width: bodyW
            });
            $('#larry-side').animate({
                width: '200px'
            });
        }
    });
    // 锁屏控制
    $('#lock').mouseover(function () {
        layer.tips('请按Alt+L快速锁屏！', '#lock', {
            tips: [1, '#FF5722'],
            time: 2000
        });
    });
    // 快捷键锁屏设置
    $(document).keydown(function (e) {
        if (e.altKey && e.which == 76) {
            lockSystem();
        }
    });
    checkLockStatus('0');
    // 锁定屏幕
    function lockSystem() {
        /*var url = '../backstage/datas/lock.json';
        $.get(
            url,
            function (data) {
                if (data == '1') {
                    checkLockStatus(1);
                } else {
                    layer.alert('锁屏失败，请稍后再试！');
                }
            });*/
			checkLockStatus(1);
        startTimer();
    }

    //解锁屏幕
    function unlockSystem() {
        // 与后台交互代码已移除，根据需求定义或删除此功能

        checkLockStatus(0);
    }

    // 点击锁屏
    $('#lock').click(function () {
        lockSystem();
    });
    // 解锁进入系统
    $('#unlock').click(function () {
        unlockSystem();
    });
    // 监控lock_password 键盘事件
    $('#lock_password').keypress(function (e) {
        var key = e.which;
        if (key == 13) {
            unlockSystem();
        }
    });

    function startTimer() {
        var today = new Date();
        var h = today.getHours();
        var m = today.getMinutes();
        var s = today.getSeconds();
        m = m < 10 ? '0' + m : m;
        s = s < 10 ? '0' + s : s;
        $('#time').html(h + ":" + m + ":" + s);
        t = setTimeout(function () {
            startTimer()
        }, 500);
    }

    // 锁屏状态检测
    function checkLockStatus(locked) {
        // 锁屏
        if (locked == 1) {
            $('.lock-screen').show();
            $('#locker').show();
            $('#layui_layout').hide();
            $('#lock_password').val('');
        } else {
            $('.lock-screen').hide();
            $('#locker').hide();
            $('#layui_layout').show();
        }
    }


    $('#dianzhan').click(function (event) {
        layer.open({
            type: 1,
            title: false,
            closeBtn: true,
            shadeClose: false,
            shade: 0.15,
            area: ['505px', '288px'],
            content: '<img src="/Public/home/images/fyHelp.jpg"/>'
        })
    });

    // 登出系统
    $('#logout').on('click', function () {
        var url = './index.php/index/resetLogin';
        common.logOut('退出登陆提示！', '你真的确定要退出系统吗？', url);
    })
    // 左侧导航菜单控制
    // $('#larrySideNav').on('click', function() {
    // 	if($('#larrySideNav .layui-this').length>0){
    //     $('.sys-public-menu .layui-nav li').removeClass('layui-this');
    // 	}
    // });
    // $('.sys-public-menu .layui-nav li').on('click',function(){
    //     $('#larrySideNav .layui-this').removeClass('layui-this');
    // });
})