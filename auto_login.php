<?php
	header ( "Content-type:text/html;charset=utf-8" );
	header("Access-Control-Allow-Origin:*"); 
	
	$REG_TIME=1;
	
	$link=mysqli_connect("10.20.1.66","raduser","radpass","radius",3306); 
	if($link){
		
		$staMac = @$_GET['staMac'] ? $_GET['staMac']:'';
		
		$staMac = str_replace(':','-',$staMac);
		
		if($staMac == ''){
			exit(json_encode(array('code'=>101)));
		}
		$check = rand(100000,999999);
		$seqid = time().$check;
		
		$q='select username,value,modify_time from radcheck where stamac="'.$staMac.'"';
		$queryMac = mysqli_query($link,$q);
		if(mysqli_num_rows($queryMac) ==1){
			$row=mysqli_fetch_array($queryMac);

			if(time()-strtotime($row[2])>$REG_TIME){

				exit(json_encode(array('code'=>102)));

			}else{

				exit(json_encode(array('code'=>100,'username'=>$row[0],'password'=>$row[1])));
			}			

		}else{
			exit(json_encode(array('code'=>103)));
		}

	}else{
		exit(json_encode(array('code'=>999)));	
	}
	
	
	

?>
