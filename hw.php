<?php 
	$link=mysqli_connect("10.20.1.66","raduser","radpass","radius",3306);

	if($link){
		
		
		$websuserip = $_GET["extend"];
		$openId = $_GET["openId"];
		$extend= $_GET["extend"];   
		$tid= $_GET["tid"]; //获取openId添加到数据库获取该用户的token
		
		$submittime = time()*1000;
		
		$check = rand(100000,999999);	
		
		$q = "select id from radcheck where username='".$openId."'";
        $rsSelect = mysqli_query($link,$q);


        if(mysqli_num_rows($rsSelect) ==1){
            $row=mysqli_fetch_array($rsSelect);

            $q = "update radcheck set value='".$check."',modify_time=current_timestamp() where id=".$row[0];
            $rs=mysqli_query($link,$q);
		$ip = "220.197.182.78";
		$ip_first = explode('.',$staIp);
		if($ip_first[0]=='10'){
			$ip = '10.110.112.2';
		}
		$file = 'log.txt';
			$content = "\r\n".date("h:i:sa")."\r\nLocation:http://".$ip.":8088/portal/auth?submit=Logon&authtype=3&username=".$openId."&password=".$check."&pagetype=".$pagetype."&vlan=".$vlan."&staMac=".$staMac."&staIp=".$staIp."&apMac=".$apMac."&apIp=".$apIp."\r\n".$ip_first[0];
			file_put_contents($file,$content,FILE_APPEND);
            if(!$rs){
                exit(json_encode(array('code'=>104)));
            }

        }else{

			$q = "insert into radcheck(username,attribute,op,value) value('".$openId."','User-Password',':=','".$check."')";
            $rs = mysqli_query($link,$q);
            if(!$rs){
                exit(json_encode(array('code'=>103)));
            }
		}
		
	}
?>
<script type="text/javascript" src="/Public/assets/js/jquery.js"></script>

<form id="LoginForm" name="LoginForm" method=post action="http://10.20.0.6:1025/login">
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
	document.LoginForm.submit();
	alert("login ok");
//-->  
</script>  