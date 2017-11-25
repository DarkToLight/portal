
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

layui.use(['tree','table','element', 'layer'], function() {
    var $ = layui.jquery, element = layui.element, layer = layui.layer;

    // 树        更多操作请查看 http://www.layui.com/demo/tree.html
    layui.tree({
        elem: '#tree' //传入元素选择器
        , click: function (item) { //点击节点回调
            layer.msg('当前节名称：' + item.name + '<br>全部参数：' + JSON.stringify(item));
            console.log(item);
        }
        , nodes: [{ //节点0
            name: '高新区'
            , children: [{
                name: '场景01'
            }, {
                name: '场景02'
            }, {
                name: '场景03'
            }, {
                name: '场景04'

            }, {
                name: '场景05'
            }]
        }, { //节点1
            name: '南明区'
            , children: [{
                name: '场景11'
            }, {
                name: '场景12'
            }, {
                name: '场景13'
            }, {
                name: '场景14'

            }, {
                name: '场景15'
            }]
        }, { //节点2
            name: '云岩区'
            , children: [{
                name: '场景21'
            }, {
                name: '场景22'
            }, {
                name: '场景23'
            }, {
                name: '场景24'

            }, {
                name: '场景25'
            }]
        }, { //节点3
            name: '乌当区'
            , children: [{
                name: '场景31'
            }, {
                name: '场景32'
            }, {
                name: '场景33'
            }, {
                name: '场景34'

            }, {
                name: '场景35'
            }]
        }, { //节点4
            name: '白云区'
            , children: [{
                name: '场景41'
            }, {
                name: '场景42'
            }, {
                name: '场景43'
            }, {
                name: '场景44'

            }, {
                name: '场景45'
            }]
        }, { //节点5
            name: '小河区'
            , children: [{
                name: '场景51'
            }, {
                name: '场景52'
            }, {
                name: '场景53'
            }, {
                name: '场景54'

            }, {
                name: '场景55'
            }]
        }, { //节点5
            name: '花溪区'
            , children: [{
                name: '场景61'
            }, {
                name: '场景62'
            }, {
                name: '场景63'
            }, {
                name: '场景64'

            }, {
                name: '场景65'
            }]
        }]
    });

    var table = layui.table;
    //方法级渲染
    table.render({
        elem: '#LAY_table_user'
        ,url: '/Public/home/datas/order.json'
        ,id: 'testReload'
        ,page: true
       // ,height: 600
        ,height: 'full-200'
        ,cellMinWidth: 80
        ,limit:20
        ,limits:[20]
        ,cols: [[
            {checkbox: true, fixed: true}
            ,{field:'id', title: 'ID',align:'center', width:'6%', sort: true, fixed: true}
            ,{field:'username', title: '区域',align:'center',  width:'10%', fixed: true}
            ,{field:'sex', title: '场景',align:'center',  width:'10%', fixed: true}
            ,{field:'city', title: 'AP名称' ,align:'center',  width:'10%', fixed: true}
            ,{field:'sign', title: 'MAC',align:'center',  width:'10%', sort: true}
            ,{field:'experience', title: 'IP',align:'center',  width:'10%', sort: true}
            ,{field:'score', title: '详细地址',align:'center',  width:'20%', sort: false}
            ,{fixed: 'right', title: '操作',align:'center',  width:180, fixed: 'right' , toolbar: '#barDemo'}
        ]]

    });

/*数据操作  开始*/
    var table = layui.table;
    //监听表格复选框选择
    table.on('checkbox(user01)', function(obj){
        console.log(obj)
    });
    //监听工具条
    table.on('tool(user01)', function(obj){
        var data = obj.data;
        if(obj.event === 'detail'){
            layer.prompt({
                formType: 2
                ,title: '修改 ID 为 ['+ data.id +'] 的用户签名'
                ,value: data.sign
            }, function(value, index) {
                layer.close(index);

                //这里一般是发送修改的Ajax请求

                //同步更新表格和缓存对应的值
                obj.update({
                    sign: value
                });
            });
            layer.msg('ID：'+ data.id + ' 添加操作');
        } else if(obj.event === 'del'){
            layer.confirm('真的删除行么', function(index){
                obj.del();
                layer.close(index);
            });
        } else if(obj.event === 'edit'){
            layer.alert('编辑行：<br>'+ JSON.stringify(data))
        }
    });

    var $ = layui.$, active = {
        getCheckData: function(){ //获取选中数据
            var checkStatus = table.checkStatus('testReload')
                ,data = checkStatus.data;
            layer.alert(JSON.stringify(data));
        }
        ,getCheckLength: function(){ //获取选中数目
            var checkStatus = table.checkStatus('testReload')
                ,data = checkStatus.data;
            layer.msg('选中了：'+ data.length + ' 个');
        }
        ,isAll: function(){ //验证是否全选
            var checkStatus = table.checkStatus('testReload');
            layer.msg(checkStatus.isAll ? '全选': '未全选')
        }

    /*数据查找 开始*/
        ,reload: function(){
            var demoReload = $('#demoReload01');

            //执行重载
            table.reload('testReload', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,where: {
                    key: {
                        id: demoReload.val()
                    }
                }
            });
        }
    };

    $('.demoTableFind .layui-btn').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    /*数据查找 结束*/
    $('.demoTable .layui-btn').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });


/*数据操作  结束*/



// 删除公共方法   deleteAll(ids,请求url,操作成功跳转url,操作失败跳转url)
    function deleteAll(ids,url,sUrl,eUrl){
        // ids不能为空
        if(ids == null || ids == ''){
            layer.msg('请选择要删除的数据',{time:2000});
            return false;
        }else{
            layer.confirm('确认删除选中数据?', {
                title: '删除',
                btn: ['确认', '取消'] // 可以无限个按钮
            }, function(index, layero){
                // 确认
                $.post(url,{ids:ids},function(res){
                    // 大于0表示删除成功
                    if(res.status > 0){
                        // 提示信息并跳转
                        layer.msg(res.msg,{time:2000},function(){
                            location.href = sUrl;
                        })
                    }else{
                        // 提示信息并跳转
                        layer.msg(res.msg,{time:2000},function(){
                            location.href = eUrl;
                        })
                    }
                });
            }, function(index){
                // 关闭
                layer.close(index);
            });
        }
    }


})
