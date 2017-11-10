<?php 
	$link=mysqli_connect("10.20.1.66","raduser","radpass","radius",3306);

	if($link){
		$websuserip = $_GET["user-ipaddress"];
		$usermac = $_GET["usermac"];
		$mac = str_replace(":","",$usermac);
		$openId = $_GET["openId"];
		$extend= $_GET["extend"];
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
		
		exit(json_encode(array('code'=>100)));
		
	}
?>
