<?php
namespace Home\Controller;

use think\Controller;

class WifiapController extends Controller
{

	function wifiap($pagenum='1',$num='15'){
		
		$start = ((int)$pagenum-1)*(int)$num;
   		$aplist = M("aplist");
		//$clinet_list= $aplist->query("SELECT a.*,c.`name` as stationname,b.`name` as linename FROM `card_client` as a , card_line as b , card_station as c WHERE a.station_id=c.id and a.line_id=b.id");
		$clinet_list = $aplist->where($condition)->order("id asc")->limit($start,$num)->field('id,name,status,mac,adname,storename,addr')->select();
		//$clinet_list = $aplist->join('card_line on card_client.line_id = card_line.id', 'left')->join('card_station on card_station.line_id = card_line.id', 'left')->where($condition)->order("card_client.id desc")->limit($start,$num)->field('card_client.id,card_client.pnum,card_client.pname,card_client.department,card_client.feecode,card_client.address,card_line.name as linename,card_station.name as stationname')->select();				
		$total=$aplist->where($condition)->count();
		$page_count = ceil($total/$num); 
		
		
   		$this->assign('aplist',$clinet_list);
   		$this->assign('nowpagenum',$pagenum);
		
		$ad_list= M('ad')->where("status=0")->field('id,name')->select();
		$adStr='';
		foreach($ad_list as $ad){
			
			$adStr=$adStr.$ad['id'].':'.$ad['name'].';';
		}

		
		$adStr=substr($adStr, 0, -1);
		
		$store_list= M('store')->field('id,name')->select();
		$storeStr='';
		foreach($store_list as $store){
			
			$storeStr=$storeStr.$store['id'].':'.$store['name'].';';
		}

		
		$storeStr=substr($storeStr, 0, -1);
		
		
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
   		$this->assign('adStr',$adStr);
   		$this->assign('storeStr',$storeStr);
   		$this->assign('indexpage',$indexpage);
		$this->assign('endpage',$endpage);
		$this->assign('page_count',$page_count);
		$this->assign('apset_active','active open');
		$this->assign('aplist_active','active');
   		$this->display();	 
	}
	
	function editAP(){
		
		$oper = I('post.oper','');
		
		
		
		$apid = I('post.id','');
		$apname = I('post.name','');
		$apbelong = I('post.storename','');
		$apmac = I('post.mac','');
		$apadnum = I('post.adname','');
		$apaddr = I('post.addr','');
		
		$data['name']=$apname;
		$data['belong']=$apbelong;
		$data['mac']=$apmac;
		$data['adnum']=$apadnum;
		$data['status']=1;
		$data['addr']=$apaddr;
		
		
		
		$aplist = M('ap');
		
		$condition['mac'] = $apmac;
		
		if($oper == 'add'){
			
			if($aplist->where($condition)->count()>=1){
		
			
				$result['code'] = 0;
				$result['message'] = "已有此AP信息,请勿新增！";
				
							
				
			}else{
			
				if($aplist->add($data)){
				
	/*				$Client_his =  M('history');
					$hisData['op'] = session("user_id").'/addLine/'.$lineName;
					$Client_his->add($hisData); */
				
					$result['code'] = 1;
					$result['message'] = "新增成功！";
				
				}else {
				
					$result['code'] = 0;
					$result['message'] = "新增失败！";
				
				}
			}
		}
		if($oper == 'edit'){
			if($aplist->where($condition)->save($data)){
		
				$result['code'] = 1;
				$result['message'] = "修改成功！";
				
				
			}
			else {
				
				$result['code'] = 2;
				$result['message'] = "修改失败！";
				
				
			}
			
		}
		if($oper == 'del'){
			
			$idarr = $idarr=explode(",",$apid);
			
			foreach($idarr as $key=>$value)
			{
				$data = array('status'=>2,'addtime'=>date('y-m-d H:i:s',time()));
				$aplist->where("id=$value")->setField($data);
				
		/*		//日志
				$cldata['pnum'] = $Clinet->where("id=$value")->getField('pnum').'-'.session("user_id");
				$cldata['active'] = '删除';
				$cldata['time'] = date('Y-m-d H:i:s',time());
				$Clientlog_info->add($cldata); */
			   
			}
				
			$result['code'] = 1;
			$result['message'] = '删除成功！';
		}
		
		
		
		
		
		
		
		
		$this->ajaxReturn($result,"JSON");
	}
	

}