<?php
	header ( "Content-type:text/html;charset=utf-8" );
    header("Access-Control-Allow-Origin:*");

	$link=mysqli_connect("10.20.1.66","raduser","radpass","radius",3306);

	if($link){
		$usermac = $_GET["staMac"];
		
		$check = $usermac; 	
		
		$q = "select id from radcheck where username = '".$usermac."'";
        $rsSelect = mysqli_query($link,$q);

		$code=100;
        if(mysqli_num_rows($rsSelect) ==1){
            $row=mysqli_fetch_array($rsSelect);

            $q = "update radcheck set value='".$check."',modify_time=current_timestamp(),type=1 where id=".$row[0];
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

			$q = "insert into radcheck(username,attribute,op,value,type) value('".$usermac."','User-Password',':=','".$check."',1)";
            $rs = mysqli_query($link,$q);
            if(!$rs){
				
                $code =103;
            }
		}
		
		exit(json_encode(array('code'=>$code,"check"=>$check)));
		
	}

