<?php
	header ( "Content-type:text/html;charset=utf-8" );
	header("Access-Control-Allow-Origin:*"); 
	
	echo 'test';
		$url = 'http://10.20.0.6:8000/login';
		$post_data = array ("username" => "test","password" => "test","submittime" => "","RedirectUrl" => "http://www.baidu.com","Login" => "Login","anonymous" => "DISABLE");
		
		$curl = curl_init(); 
	// 设置你需要抓取的URL 
		curl_setopt($curl, CURLOPT_URL, $url); 
	// 设置header 响应头是否输出
		curl_setopt($curl, CURLOPT_HEADER, 0); 
		curl_setopt($curl, CURLOPT_POST, 1);
	// 设置cURL 参数，要求结果保存到字符串中还是输出到屏幕上。
	// 1如果成功只将结果返回，不自动输出任何内容。如果失败返回FALSE 
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, 0); 
		curl_setopt($curl, CURLOPT_POSTFIELDS, $post_data);
	// 运行cURL，请求网页 
		$data = curl_exec($curl); 
	// 关闭URL请求 
		curl_close($curl); 
	// 显示获得的数据 
		print_r($data);
	
	

?>
