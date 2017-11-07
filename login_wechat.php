<?php 

	$websuserip = $_GET["user-ipaddress"];
	$openId = $_GET["openId"];
	$check = $_GET["check"];
	$submittime = time()*1000;
	
?>
<script type="text/javascript" src="Public/assets/js/jquery.js"></script>

<form id="LoginForm" name="LoginForm" method=post action="http://10.20.0.6:8000/login">
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
		$.ajax({
				type : 'get',
				url : '/auto_login.php?staMac=213123',
				dataType : "json",
				success : function(data) {
						
					if(data.code==100){
							
						USER_NAME = usermac;
						PASS_WORD = data.check;
					}

				},
				error : function(e) {

				}
			});

 //document.LoginForm.submit();
</script>  