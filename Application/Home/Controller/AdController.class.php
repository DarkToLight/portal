<?php
namespace Home\Controller;

use think\Controller;

class AdController extends Controller
{
		function ad($pagenum='1',$num='15'){
		
		$start = ((int)$pagenum-1)*(int)$num;
   		$adlist = M("adlist");
		//$clinet_list= $adlist->query("SELECT a.*,c.`name` as stationname,b.`name` as linename FROM `card_client` as a , card_line as b , card_station as c WHERE a.station_id=c.id and a.line_id=b.id");
		$clinet_list = $adlist->where($condition)->order("id asc")->limit($start,$num)->field('id,name,status,storename,image,thumb')->select();				
		//$clinet_list = $adlist->join('card_line on card_client.line_id = card_line.id', 'left')->join('card_station on card_station.line_id = card_line.id', 'left')->where($condition)->order("card_client.id desc")->limit($start,$num)->field('card_client.id,card_client.pnum,card_client.pname,card_client.department,card_client.feecode,card_client.address,card_line.name as linename,card_station.name as stationname')->select();				
		$total=$adlist->where($condition)->count();
		$page_count = ceil($total/$num); 
		
   		$this->assign('adlist',$clinet_list);
   		$this->assign('nowpagenum',$pagenum);

   		if( (int)$page_count % (int)$num != 0){
   			$count1 = (int)$count / (int)$num + 1;
   		}else{
   			$count1 = (int)$count / (int)$num;
   		}
		//解决%问题	
		$condition['department']=$department;


		foreach($condition as $key=>$val) {
			
			$val = is_array($val)?end($val):$val;	
			$parameter.="$key=".urlencode($val)."&";//赋值给Page
			
		}
		
		
		$parameter = str_replace(array("wifi_ap."),"",$parameter);


        if((int)$pagenum<(int)$page_count){
   			$next=(int)$pagenum+1;
   			$nextpage = "<span><a href='searchList?pagenum={$next}&num=".$num."&".$parameter."'>下一页</a></span>";
   			$this->assign('nextpage',$nextpage);
   		}
		
   		if((int)$pagenum>1){
   			$pre=(int)$pagenum-1;
   			$prepage = "<span><a href='searchList?pagenum={$pre}&num=".$num."&".$parameter."'>上一页</a></span>";
   			$this->assign('prepage',$prepage);
   		}
		$indexpage = "<a href='searchList?pagenum=1&num=".$num."&".$parameter."'>首页</a>";
   		$endpage = "<a href='searchList?pagenum=".$page_count."&num=".$num."&".$parameter."'>尾页</a>";
   		$this->assign('indexpage',$indexpage);
		$this->assign('endpage',$endpage);
		$this->assign('page_count',$page_count);
		$this->assign('ad_active','active');
   		$this->display();	 
	}
	
	public function delAD(){
				
		$id = isset($_POST['id'])?trim($_POST['id']):'';
		
		if($id !=''){
			
			$Clinet = M('ad');		
		//	$Clientlog_info =  M('clientlog');
		
			$data = array('status'=>2,'addtime'=>date('y-m-d H:i:s',time()));
			$Clinet->where("id=$id")->setField($data);
				
			
			$result['code'] = 1;
			$result['message'] = '删除成功！';
		
		}else {
            
            $result['code'] = 0;
            $result['message'] = "数据为空！";
        }
	   
        $this->ajaxReturn($result,"JSON");
	}
	
	public function addAD(){
		$name = isset($_POST['name'])?trim($_POST['name']):'';
		$belong = isset($_POST['belong'])?trim($_POST['belong']):'';				
		
        //导入上传类 
        $upload = new \Think\Upload(); 
        //设置上传文件大小 
        $upload->maxSize = 3292200; 
        //设置上传文件类型 
        $upload->allowExts = explode(',', 'jpg,gif,png,jpeg'); 
        //设置附件上传目录 
		$upload->rootPath = './';
        $upload->savePath = 'Public/Uploads/'; 
        //设置需要生成缩略图，仅对图像文件有效 
        $upload->thumb = true; 
        //设置需要生成缩略图的文件后缀 
        $upload->thumbPrefix = 'm_';  //生产2张缩略图 
        //设置缩略图最大宽度 
        $upload->thumbMaxWidth = '100,400'; 
        $upload->autoSub = false; 
        //设置缩略图最大高度 
        $upload->thumbMaxHeight = '100,400'; 
		$upload->thumbPath = 'thumb/';
		$upload->thumbRemoveOrigin = false; //上传图片后不删除原图片  
        //设置上传文件规则 
        $upload->saveRule = uniqid; 
        //删除原图 
		$info=$upload->upload();
        if (!$info) { 
            //捕获上传异常 
            $this->error($upload->getError()); 
        } else { 
			$file=$info['file'];
			$image = new \Think\Image();
            $image->open('./Public/Uploads/'.$file['savename']);    //打开上传图片
            $image->thumb(150, 150,\Think\Image::IMAGE_THUMB_FIXED)->save('./Public/Uploads/thumb_'.$file['savename']);//生成缩略图
			
			$ad = M('ad');
			$data['name']=$name;
			$data['belong']=$belong;
			$data['status']=0;
			$data['image']='Uploads/'.$file['savename'];
			$data['thumb']='Uploads/thumb_'.$file['savename'];
			
			
			
			if($ad->add($data)){
				
	/*			$Client_his =  M('history');
				$hisData['op'] = session("user_id").'/addLine/'.$lineName;
				$Client_his->add($hisData); */
				
				$result['code'] = 1;
				$result['message'] = "新增成功！";
				
			}else {
				
				$result['code'] = 0;
				$result['message'] = "新增失败！";
				
			}
			
			
			
        }		
	   
        $this->ajaxReturn($result,"JSON");
	}
	public function editAD(){
		$name = isset($_POST['name'])?trim($_POST['name']):'';
		$id = isset($_POST['id'])?trim($_POST['id']):'';
		$belong = isset($_POST['belong'])?trim($_POST['belong']):'';				
		
        //导入上传类 
        $upload = new \Think\Upload(); 
        //设置上传文件大小 
        $upload->maxSize = 3292200; 
        //设置上传文件类型 
        $upload->allowExts = explode(',', 'jpg,gif,png,jpeg'); 
        //设置附件上传目录 
		$upload->rootPath = './';
        $upload->savePath = 'Public/Uploads/'; 
        //设置需要生成缩略图，仅对图像文件有效 
        $upload->thumb = true; 
        //设置需要生成缩略图的文件后缀 
        $upload->thumbPrefix = 'm_';  //生产2张缩略图 
        //设置缩略图最大宽度 
        $upload->thumbMaxWidth = '100,400'; 
        $upload->autoSub = false; 
        //设置缩略图最大高度 
        $upload->thumbMaxHeight = '100,400'; 
		$upload->thumbPath = 'thumb/';
		$upload->thumbRemoveOrigin = false; //上传图片后不删除原图片  
        //设置上传文件规则 
        $upload->saveRule = uniqid; 
        //删除原图 
		$info=$upload->upload();
        if (!$info) { 
            //捕获上传异常 
            $ad = M('ad');
			$data['name']=$name;
			$data['belong']=$belong;
			
			if($ad->where("id=$id")->save($data)){
				
	/*			$Client_his =  M('history');
				$hisData['op'] = session("user_id").'/addLine/'.$lineName;
				$Client_his->add($hisData); */
				
				$result['code'] = 1;
				$result['message'] = "修改成功！";
				
			}else {
				
				$result['code'] = 0;
				$result['message'] = "修改失败！";
				
			}
			
        } else { 
			$file=$info['file'];
			$image = new \Think\Image();
            $image->open('./Public/Uploads/'.$file['savename']);    //打开上传图片
            $image->thumb(150, 150,\Think\Image::IMAGE_THUMB_FIXED)->save('./Public/Uploads/thumb_'.$file['savename']);//生成缩略图
			
			$ad = M('ad');
			$data['name']=$name;
			$data['belong']=$belong;
			$data['status']=0;
			$data['image']='Uploads/'.$file['savename'];
			$data['thumb']='Uploads/thumb_'.$file['savename'];
			
			
			
			if($ad->where("id=$id")->save($data)){
				
	/*			$Client_his =  M('history');
				$hisData['op'] = session("user_id").'/addLine/'.$lineName;
				$Client_his->add($hisData); */
				
				$result['code'] = 1;
				$result['message'] = "修改成功！";
				
			}else {
				
				$result['code'] = 0;
				$result['message'] = "修改失败！";
				
			}
			
			
			
        }		
	   
        $this->ajaxReturn($result,"JSON");
	}
	
	

}