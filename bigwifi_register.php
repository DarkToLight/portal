<?php
	header ( "Content-type:text/html;charset=utf-8" );
    header("Access-Control-Allow-Origin:*");

	$link=mysqli_connect("10.20.1.66","raduser","radpass","radius",3306);

	if($link){
		$pagetype = 5;

		$vlan = 4095;
		$staMac = $_GET["mac"];
		$apMac = $_GET["bmac"];
		$openid = $_GET["openid"]?$_GET["openid"]:$staMac."_login";
	
	$check = rand(100000,999999);

	$url='http://10.20.1.66/clearTemp.php?staMac='.$staMac;

		$curl = curl_init(); 
	// 设置你需要抓取的URL 
		curl_setopt($curl, CURLOPT_URL, $url); 
	// 设置header 响应头是否输出
		curl_setopt($curl, CURLOPT_HEADER, 0); 
	// 设置cURL 参数，要求结果保存到字符串中还是输出到屏幕上。
	// 1如果成功只将结果返回，不自动输出任何内容。如果失败返回FALSE 
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1); 
	// 运行cURL，请求网页 
		$data = curl_exec($curl); 
	// 关闭URL请求 
		curl_close($curl);

	$q = "select id,staIp,apIp from radcheck where username='".$staMac."'";
	$rs = mysqli_query($link,$q);
	$rsRow = mysqli_fetch_array($rs);
	$staIp=$rsRow[1];
	$apIp = $rsRow[2];

	$q = "select id from radcheck where username='".$openid."'";
        $rsSelect = mysqli_query($link,$q);
		$code=100;
        if(mysqli_num_rows($rsSelect) ==1){
		
            $row=mysqli_fetch_array($rsSelect);

            $q = "update radcheck set value='".$check."',modify_time=current_timestamp() where id=".$row[0];
            $rs=mysqli_query($link,$q);
			$ip = "220.197.182.78";
			$ip_first = explode('.',$staIp);
			if($ip_first[0]=='10'){
				$ip = '10.110.112.2';
			}
            if(!$rs){
                $code=104;
            }

        }else{

			$q = "insert into radcheck(username,attribute,op,value,type) value('".$openid."','User-Password',':=','".$check."',3)";
            $rs = mysqli_query($link,$q);
            if(!$rs){
                $code =103;
            }
		}
		$curl = curl_init(); 
		$url = "http://10.110.112.2:8088/portal/auth?Submit=Logon&authtype=3&username=".$openid."&password=".$check."&pagetype=".$pagetype."&vlan=".$vlan."&staMac=".$staMac."&staIp=".$staIp."&apMac=".$apMac."&apIp=1".$apIp;

		$file = 'log.txt';
		$content = "\r\n".date("h:i:sa")."\r\nbigwifi_Location:http://".$ip.":8088/portal/auth?submit=Logon&authtype=3&username=".$openid."&password=".$check."&pagetype=".$pagetype."&vlan=".$vlan."&staMac=".$staMac."&staIp=".$staIp."&apMac=".$apMac."&apIp=".$apIp."\r\n".$ip_first[0];

	// 设置你需要抓取的URL 
		curl_setopt($curl, CURLOPT_URL, $url); 
	// 设置header 响应头是否输出
		curl_setopt($curl, CURLOPT_HEADER, 0); 
	// 设置cURL 参数，要求结果保存到字符串中还是输出到屏幕上。
	// 1如果成功只将结果返回，不自动输出任何内容。如果失败返回FALSE 
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1); 
	// 运行cURL，请求网页 
		$data = curl_exec($curl); 
	// 关闭URL请求 
		curl_close($curl);

		
		exit(json_encode(array('code'=>$code)));
		
	}

