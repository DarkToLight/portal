<?php
	header ( "Content-type:text/html;charset=utf-8" );
    header("Access-Control-Allow-Origin:*");

	$link=mysqli_connect("10.20.1.66","raduser","radpass","radius",3306);
	$code = 100;
	if($link){
		$mac = $_GET["wlanusermac"];
		$acname = $_GET["wlanacname"];
		$userip = $_GET["wlanuserip"];
		$ssid = $_GET["ssid"];
		$curl = curl_init(); 
		$url = "http://10.20.0.8/portal/logon.cgi?wlanusermac=".$mac."&wlanacname=".$acname."&wlanuserip=".$userip."&ssid=".$ssid;
		$post_data = array ("PtUser" => $mac,
			"PtPwd" => $mac,
			"PtButton"=>"Logon");
		//$file = 'log.txt';
		//$content = "\r\n".date("h:i:sa")."\r\nLocation:http://".$ip.":8088/portal/auth?submit=Logon&authtype=3&username=".$staMac."&password=".$check."&pagetype=".$pagetype."&vlan=".$vlan."&staMac=".$staMac."&staIp=".$staIp."&apMac=".$apMac."&apIp=".$apIp."\r\n".$ip_first[0];

	// 设置你需要抓取的URL 
		curl_setopt($curl, CURLOPT_URL, $url); 
	// 设置参数
		curl_setopt($curl, CURLOPT_POST, 1);
		curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
		curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);

		curl_setopt($curl, CURLOPT_POSTFIELDS, $post_data);
	// 设置header 响应头是否输出
		curl_setopt($curl, CURLOPT_HEADER, 0); 
	// 设置cURL 参数，要求结果保存到字符串中还是输出到屏幕上。
	// 1如果成功只将结果返回，不自动输出任何内容。如果失败返回FALSE 
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1); 
	// 运行cURL，请求网页 
		$ret = curl_exec($curl);
// $info 以 array 形式返回跳转信息
		$info = curl_getinfo($curl);
// 跳转后的 URL 信息
		$retURL = $info['url'];
		curl_close($curl);
		$link=mysqli_connect("10.20.1.66","raduser","radpass","radius",3306);
	ini_set("display_errors", "On");

	if($link){
		$usermac = $_GET["usermac"];
		$openId = $_GET["openId"];
		$tid= $_GET["tid"]; //获取openId添加到数据库获取该用户的token
		
		$q = "select id from radcheck where username='".$mac."'";
        $rsSelect = mysqli_query($link,$q);


        if(mysqli_num_rows($rsSelect) ==1){
            $row=mysqli_fetch_array($rsSelect);

            $q = "update radcheck set modify_time=current_timestamp(),openid='".$openId."' where id=".$row[0];
            $rs=mysqli_query($link,$q);
            if(!$rs){
                exit(json_encode(array('code'=>104)));
			}

		}
		
	}
		exit(json_encode(array('code'=>$code)));
		
	}

?>