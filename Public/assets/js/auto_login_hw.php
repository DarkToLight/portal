<?php
	header ( "Content-type:text/html;charset=utf-8" );
    header("Access-Control-Allow-Origin:*");

	$link=mysqli_connect("10.110.112.4","raduser","radpass","radius",3306);

	if($link){
		$usermac = $_GET["staMac"];
		
	$check = rand(100000,999999);	
		
		$q = "select id from radcheck where username='".$usermac."'";
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

			$q = "insert into radcheck(username,attribute,op,value,type) value('".$usermac."','User-Password',':=','".$check."',4)";
            $rs = mysqli_query($link,$q);
            if(!$rs){
				
                $code =103;
            }
		}
/*		$curl = curl_init(); 
		$url = "https://10.20.0.6:1025/login";
		$post_data = array ("username" => $websuserip,
			"password" => $check,
			"websuserip"=>$websuserip,
			"submittime"=>time()*1000,
			"RedirectUrl"=>"http://www.fyxtw.com",
			"anonymous"=>"DISABLE",
			"Login"=>"Login",
			"checkbox"=>"on");
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
		echo curl_error($curl)."<BR>";
		print_r($post_data);
		echo "<BR>";
		print_r($ret);
		exit();
		curl_close($curl); */
		
		exit(json_encode(array('code'=>$code,"check"=>$check)));
		
	}

