<?php
	header ( "Content-type:text/html;charset=utf-8" );
	header("Access-Control-Allow-Origin:*"); 
	
	$link=mysqli_connect("10.20.1.66","raduser","radpass","radius",3306); 
	if($link){
		
		$mobile = @$_GET['mobile'] ? $_GET['mobile']:0;
		if($mobile == 0){
			exit(json_encode(array('code'=>101)));
		}
		$check = rand(100000,999999);
		$seqid = time().$check;
	
		$message = '您本次登录的验证码为'.$check;
	
		$url = 'http://sh999.eucp.b2m.cn:8080/sdkproxy/sendsms.action?cdkey=9SDK-EMY-0999-RFSUO&password=503934&phone='.$mobile.'&message='.$message.'&addserial=&seqid='.$seqid;
				
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
		
		echo curl_error($curl);
		
	// 关闭URL请求 
		curl_close($curl); 
		
		
		
	// 显示获得的数据 
		$xml = simplexml_load_string(preg_replace('/((\s)*(\n)+(\s)*)/i','',$data));
		$code=100;
		$smscode=$xml->error;
		if($smscode==0){
			$q = "select id from radcheck where username='".$mobile."'";
			$rsSelect = mysqli_query($link,$q);
			
			
			
			if(mysqli_num_rows($rsSelect) ==1){
				$row=mysqli_fetch_array($rsSelect);
				
				$q = "update radcheck set value='".$check."' where id=".$row[0];
				$rs=mysqli_query($link,$q);
				if($rs){
					$code=100;
				}else{
					$code=104;
				}

			}else{
				$q = "insert into radcheck(username,attribute,op,value) value('".$mobile."','User-Password',':=','".$check."')";
				$rs = mysqli_query($link,$q);
				if($rs){
					$code=100;
				}else{
					$code=103;
				}
				

			}
			
			exit(json_encode(array('code'=>$code,'check'=>$check)));
			
			
		}else{
			exit(json_encode(array('code'=>$smscode)));
		}
		
	}else{
		echo mysqli_connect_error();
		return json_encode(array('code'=>102));
	}
	
	
	

?>
