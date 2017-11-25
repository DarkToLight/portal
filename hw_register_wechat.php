<?php
	header ( "Content-type:text/html;charset=utf-8" );
    header("Access-Control-Allow-Origin:*");

	$link=mysqli_connect("10.20.1.66","raduser","radpass","radius",3306);

	if($link){
		
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
            if($rs){
				exit(json_encode(array('code'=>100)));
                //header("Location:http://10.20.0.6:8000/login?username=".$openId."&password=".$check."&submittime=".$submittime."&RedirectUrl=http://baidu.com&websuserip=&checkbox=on&Login=Login&anonymous=DISABLE");
            }else{
                exit(json_encode(array('code'=>104)));
            }

        }else{

			$q = "insert into radcheck(username,attribute,op,value) value('".$openId."','User-Password',':=','".$check."')";
            $rs = mysqli_query($link,$q);
            if($rs){
				exit(json_encode(array('code'=>100)));
                //header("Location:http://10.20.0.6:8000/login?username=".$openId."&password=".$check."&submittime=".$submittime."&RedirectUrl=http://baidu.com&websuserip=&checkbox=on&Login=Login&anonymous=DISABLE");
            }else{
                exit(json_encode(array('code'=>103)));
            }
		}
			
		
	}

