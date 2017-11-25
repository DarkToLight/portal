<?php 

	$submittime = time()*1000;
	
?>
<script type="text/javascript" src="Public/assets/js/jquery.js"></script>

<form id="LoginForm" name="LoginForm" method=get action="http://10.20.0.6:8000/login">
		<input type="hidden" name="username" id='mobile' value="13021325141" type="text"  placeholder="请输入手机号码"/>
		<input type="hidden" name="password" id='check' type="text" value="490392" placeholder="请输入验证码"/>
        <INPUT type="hidden"  id="submittime" name="submittime" value="<?php echo $submittime;?>">
        <INPUT type="hidden"  id="RedirectUrl" name="RedirectUrl" value="http://www.baidu.com">
		<INPUT type="hidden"  id="websuserip" name="websuserip" value="10.21.64.82">
		<INPUT type="hidden"  id="checkbox" name="checkbox" value="on">
        <INPUT type="hidden"  id="Login" name="Login" value="Login">
		<INPUT type="hidden"  id="anonymous" name="anonymous" value="DISABLE">
</form>


<script type="text/javascript">
 document.LoginForm.submit();
</script>  