<?php
	header ( "Content-type:text/html;charset=utf-8" );
    header("Access-Control-Allow-Origin:*");

	$link=mysqli_connect("220.197.182.74","raduser","radpass","radius",3306);

	if($link){
		$openId = $_GET["openId"];   
		$extend= $_GET["extend"];   
		$tid= $_GET["tid"]; //获取openId添加到数据库获取该用户的token
	if(!$openId){
	return 'test';	
}	
		$q = "select id from radcheck where username='".$openId."'";
        $rsSelect = mysqli_query($link,$q);


        if(mysqli_num_rows($rsSelect) ==1){
            $row=mysqli_fetch_array($rsSelect);

            $q = "update radcheck set value='".$tid."' where id=".$row[0];
            $rs=mysqli_query($link,$q);
            if($rs){
             header("Location:http://220.197.182.78:8088/portal/auth?submit=Logon&authtype=3&username=".$openId."&password=".$tid."&pagetype=".$pagetype."&vlan=".$vlan."&staMac=".$staMac."&staIp=".$staIp."&apMac=".$apMac."&apIp=".$apIp);
		}else{
                exit(json_encode(array('code'=>104)));
            }

        }else{

			$q = "insert into radcheck(username,attribute,op,value) value('".$openId."','User-Password',':=','".$tid."')";
            $rs = mysqli_query($link,$q);
            if($rs){
         header("Location:http://220.197.182.78:8088/portal/auth?submit=Logon&authtype=3&username=".$openId."&password=".$tid."&pagetype=".$pagetype."&vlan=".$vlan."&staMac=".$staMac."&staIp=".$staIp."&apMac=".$apMac."&apIp=".$apIp);    
	}else{
                exit(json_encode(array('code'=>103)));
            }
		}
	
	}
	
	
	
