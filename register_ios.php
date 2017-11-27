<?php
	header ( "Content-type:text/html;charset=utf-8" );
    header("Access-Control-Allow-Origin:*");

	$link=mysqli_connect("10.20.1.66","raduser","radpass","radius",3306);

	if($link){
		
		$mac = $_GET["mac"];
		$username = str_replace(":","",$mac);
		$phone= @$_POST['username'] ? $_POST['username']:$username;

		$q = "select id from radcheck where username='".$username."'";
		echo $q;
        $rsSelect = mysqli_query($link,$q);


        if(mysqli_num_rows($rsSelect) ==1){
            $row=mysqli_fetch_array($rsSelect);

            $q = "update radcheck set openid='".$phone."',modify_time=current_timestamp() where id=".$row[0];
            $rs=mysqli_query($link,$q);
            if($rs){
                header("Location:http://mp.weixin.qq.com/s/jg2fLqN9CnNANNOSXpYv1w");
            }else{
				header("Location:http://mp.weixin.qq.com/s/jg2fLqN9CnNANNOSXpYv1w");
                exit(json_encode(array('code'=>104)));
            }
		}
			
		
	}