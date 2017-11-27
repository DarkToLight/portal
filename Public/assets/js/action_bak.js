	var $id = function(id){return document.getElementById(id)};
	var ac_addr = "http://220.197.182.78:8088";
	var $tips = $id('login-tips'),
        $user = $id('txt_user_name'),
        $pwd = $id('txt_password'),
        $button = $id('log-button');
		
	var portalName;
	var logonType;
	var authtype;
	var logonTip = 0;
	var session_id;
	var onlineTime;
	var expireTime;
	var remoteGoUrl;
	var webAuthSuccUrl;
	var webAuthFailUrl;
	var freetime;
	
	var serverUrl = ac_addr + '/portal/auth';

	
	var logonErrInfo = new Array(
		"",
		"正在登录，请稍候···",
		"用户名或者密码错误！",
		"登录超时，请重新登录！",
		"该用户名已被禁用！",
		"用户已过期！",
		"该时间段禁止认证，请稍候重试！",
		"该用户名已达认证用户上限！",
		"请求服务器失败，请稍后再试",
		"登录成功",
		"退出登录成功，请重新登录",
		"您没有权限使用该用户名进行认证！",
		"认证方式错误",
		"正在连接外部认证服务器",
		"远程Portal页面指定的AC地址错误！",
		0,0);
	var INFO_TIP_INIT        =    0;
	var INFO_TIP_REFRESH     =    1;
	var INFO_TIP_ERRCODE     =    2;
	var INFO_TIP_TIMEOUT     =    3;
	var INFO_TIP_BLACKUSER   =    4;
	var INFO_TIP_USEREXPIRE  =    5;
	var INFO_TIP_INVALIDTIME =    6;
	var INFO_TIP_USERFULL    =    7;
	var INFO_TIP_SERVERERR   =    8;
	var INFO_TIP_SUCCESS     =    9;
	var INFO_TIP_LOGOUT      =    10;
	var INFO_TIP_MAC_CONFLICT =   11;
	var INFO_TIP_AUTHMODE_ERROR = 12;
	var INFO_TIP_REMOTE_GOURL =   13;
	var AUTHSTATUS_REMOTE_ADDR_ERR =   14;
		
		
	function doGet(url, data, success, failed)
	{
        var param = "";
        for (var key in data)
		{
            param += key+"="+encodeURIComponent(data[key]) + '&';
        }
        url += "?"+param.substr(0, param.length-1);
        var locationStr = window.location.search;
        var urlPara = locationStr.substr(locationStr.indexOf('?')+1);
        url += "&" + urlPara;
		
        var xmlHttp = window.XMLHttpRequest ? (new XMLHttpRequest()) : (new ActiveXObject("Microsoft.XMLHTTP"));
        xmlHttp.open("GET", url);
        xmlHttp.setRequestHeader("Accept","text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");
        xmlHttp.send(null);
		
        xmlHttp.onreadystatechange = function() 
		{
            if ((xmlHttp.readyState == 4)) 
			{
                if (xmlHttp.status == 200)
				{
                    if (typeof success == 'function')
					{
                        success.call(null, xmlHttp.responseText);
                    }
                }
                else
				{
                    if (typeof failed == 'function')
					{
                        failed.call(null, xmlHttp.responseText);
                    }
                }
            } 
			else 
			{
            }
        }
    }
	
	function asctochar(high, low)
	{
		var connect = 0;
		if ( high >= '0' && high <= '9' )
		{
			high = high.charCodeAt() - 48; 
		}
		if ( high >= 'A' && high <= 'F' )
		{
			high = high.charCodeAt() - 55;
		}
		if ( low >= '0' && low <= '9' )
		{
			low = low.charCodeAt() - 48; 
		}
		if ( low >= 'A' && low <= 'F' )
		{
			low = low.charCodeAt() - 55;
		}
		connect = high*16+low;
		return connect;
	}

	function strASCdecode(sourceId)
	{
		var tempstr = sourceId;
		var index = 0;
		var ptr = 0;
		var tempDecode = '';
		var high, low, high1,low1,high2,low2,inter1, inter2, inter;
		var charcode = 0;
		
		for ( index = 0; index <  tempstr.length; )
		{
			high = tempstr.slice(index,index+1);
			low  = tempstr.slice(index+1,index+2);
			inter = asctochar(high,low);
			if ( 0 <= inter && inter <= 0x007f )
			{
				tempDecode += String.fromCharCode(inter);
				index += 2;
				continue;
			}
			if ( 192 <= inter && inter <= 223 )
			{
				high1 = tempstr.slice(index+2,index+3);
				low1 = tempstr.slice(index+3,index+4);
				inter1 = asctochar(high1,low1);
				charcode = ((inter-192)<<6) + (inter1-128);
				tempDecode += String.fromCharCode(charcode);
				index += 4;
				continue;
			}
			if ( 224<= inter && inter <= 239 )
			{
				high1 = tempstr.slice(index+2,index+3);
				low1 = tempstr.slice(index+3,index+4);
				high2 = tempstr.slice(index+4,index+5);
				low2 = tempstr.slice(index+5,index+6);
				inter1 = asctochar(high1,low1);
				inter2 = asctochar(high2,low2);
				charcode = ((inter-224)<<12)+((inter1-128)<<6)+(inter2-128);
				tempDecode += String.fromCharCode(charcode);
				index += 6;
				continue;
			}
			else
			{
				tempDecode = sourceId;
				break;
			}
		}
		return tempDecode;
	}
	
	function pageConfigParse()
	{
        if (INFO_TIP_ERRCODE == logonTip ||
               INFO_TIP_TIMEOUT == logonTip ||
               INFO_TIP_BLACKUSER == logonTip ||
               INFO_TIP_USEREXPIRE == logonTip ||
               INFO_TIP_INVALIDTIME == logonTip ||
               INFO_TIP_USERFULL == logonTip ||
               INFO_TIP_MAC_CONFLICT == logonTip ||
			   AUTHSTATUS_REMOTE_ADDR_ERR == logonTip)
        {
			if (undefined != webAuthFailUrl && "" != webAuthFailUrl)
			{
				window.location.href = webAuthFailUrl;
				return;
			}
			else
			{
				$("#log_msg").innerHTML.innerHTML = logonErrInfo[logonTip];
				$("#mobile").value = '';
				$("#check").value = '';
			}
		}
		else if (INFO_TIP_SUCCESS == logonTip)
		{
			if (undefined != webAuthSuccUrl && "" != webAuthSuccUrl)
			{
				window.location.href = webAuthSuccUrl;
				return;
			}
			else
			{
				var locationStr = window.location.search;
				var urlPara = locationStr.substr(locationStr.indexOf('?')+1);

				var goUrl = serverUrl + "?" +  urlPara
				window.location.href = goUrl;
				return;
			}
        }
        
    }
	
	function onSuccess(oriString)
	{
		var arrHead = "new Array(";
		var startIndex = oriString.indexOf(arrHead);
		var endIndex = oriString.indexOf("0,0)\;");
		var configString = oriString.substring(startIndex+arrHead.length,endIndex);
			configString = configString.replace(/\"/g,"");
        var config = configString.split(',');
		
        if (config.length < 1)
		{
            onFailed();
        }
		else if (config.length == 4)
		{
			var locationStr = window.location.search;
			var urlPara = locationStr.substr(locationStr.indexOf('?')+1);

			var goUrl = serverUrl + "?" +  urlPara
            window.location.href = goUrl;
            return;
		}
        else if (config.length >= 20)
		{
			portalName		= config[2];
			logonType		= parseInt(config[3],10);
			authtype		= parseInt(config[12],10);
			logonTip		= parseInt(config[13],10);
			session_id		= strASCdecode(config[14]);
			onlineTime		= parseInt(config[15],10);
			expireTime		= config[16];
			remoteGoUrl		= config[17];
			webAuthSuccUrl	= config[18];
			webAuthFailUrl	= config[19];
            freetime        = onlineTime;
			
			if (INFO_TIP_REFRESH == logonTip)
			{
				setTimeout(doRefresh, 1000);
			}
			else
			{
				pageConfigParse();
			}
        }
		else
		{
			window.location.reload();
		}
    }
	
	function onFailed()
	{
		$("#log_msg").innerHTML = logonErrInfo[INFO_TIP_SERVERERR];
    }
	
	function doRefresh()
	{
        doGet(serverUrl, {"refresh":"true","authtype":"5","session_id":session_id}, onSuccess, onFailed);
    }
	
	function handleSubmit(){
		
		var mobile=$('#mobile').val();
		var pwd = $('#check').val();
		if(mobile == '' || pwd == ''){
			alert("请检查手机号码及验证码是否输入");
			return;
		}
		doGet(serverUrl, {"Submit":"Logon","authtype":"5", "username":mobile, "password":pwd}, onSuccess, onFailed); //
		
    }

	function wechat(){
        //      alert('test');
                               doGet(serverUrl, {"Submit":"Logon","authtype":"3"}, onSuccess, onFailed);
                                       }	
	
			var countdown=60; 
		function settime(obj) {
			
		
			if (countdown == 0) { 
				obj.removeAttribute("disabled");
				obj.innerHTML="获取验证码";
				countdown = 60; 
				return;
			} else { 
				obj.setAttribute("disabled", true); 
				obj.innerHTML="重新发送(" + countdown + ")"; 
				countdown--;
				if(countdown == 60){
					
				}
			} 
			setTimeout(function() { 
				settime(obj) }
				,1000) 
		}
		
		function ask_check(obj){
			var mobile = $('#mobile').val();
			if(!judge_mobile(mobile)){
				alert("手机号码有误，请重新输入");
			}else{
				$.ajax({
					type : 'get',
					url : '/register.php?mobile='+mobile,
					dataType : "json",
					success : function(data) {
						
						console.log(data.code);
						if(data.code=100){
							settime(obj)
						}

					},
					error : function(e) {
					alert('err');
						console.log(e);
					}
				});
				
				
				
			}
		
		}
		
		
		function judge_mobile(mobile_num){
			
			var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
			if(!myreg.test(mobile_num)) 
			{ 
				return false; 
			}else{
				return true;
			}
		
		}
	
