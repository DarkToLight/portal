
<script type="text/javascript" src="/Public/assets/js/jquery.js"></script>

<form id="LoginForm" name="LoginForm" method=post action="https://10.20.0.6:8000/login">
		<input type="hidden" name="username" id='mobile' value="<?php echo $openId;?>" type="text"  placeholder="请输入手机号码"/>
		<input type="hidden" name="password" id='check' type="text" value="<?php echo $check;?>" placeholder="请输入验证码"/>
        <INPUT type="hidden"  id="submittime" name="submittime" value="<?php echo $submittime;?>">
        <INPUT type="hidden"  id="RedirectUrl" name="RedirectUrl" value="http://www.baidu.com">
		<INPUT type="hidden"  id="websuserip" name="websuserip" value="<?php echo $websuserip;?>">
		<INPUT type="hidden"  id="checkbox" name="checkbox" value="on">
        <INPUT type="hidden"  id="Login" name="Login" value="Login">
		<INPUT type="hidden"  id="anonymous" name="anonymous" value="DISABLE">
</form>


 <script type="text/javascript">  
<!--  
	function autologin(){
		var username = $("#mobile").val();
		var password = $("#check").val();
		var submittime = $("#submittime").val();
		var websuserip = $("#websuserip").val();
		$.ajax({
				type : 'post',
				url : 'https://10.110.112.3/register.php?mobile=13021325141',
				success : function(data) {

					if(data.code==100){
						console.log(data);
					}

				},
				error : function(e) {

					console.log(e);
				}
			});
	}
    autologin();
//-->  
</script>  