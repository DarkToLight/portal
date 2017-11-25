<?php
namespace Org\Util;
/*
 +----------------------------------------
 |PageBar生成:PageBar.php
 +----------------------------------------
 |Auth:<dark2light@qq.com>
 +----------------------------------------
 |version:v1.0.0
 +----------------------------------------
 |main:根据总记录数获取分页导航条
 +----------------------------------------
*/
class PageBar
{
    public $pre;//上一页 previous
    public $nxt;//下一页 next
    public $crt;//当前页 current
    public $hgt;//一页显示几条height
    public $lft;//前面有几页 left
    public $rgt;//后面有几页 right
    public $rowCnt;//后面有几页 right
    public $tot;//总共多少页 total
    public $data;//分页回来的数据
    public $name;//名称
    public $qry;//查询语句
    public $pageBar;//导航
    public $act;//处理的连接
    public $pms;//携带的参数
    public function __construct($crt, $crtData, $rowCnt,  $act = '', $pms=[], $hgt = 10,$lft = 4, $rgt = 4)
    {
        $this->crt=$crt;
        $this->rowCnt=$rowCnt;
        $this->hgt=$hgt;
        $this->lft=$lft;
        $this->rgt=$rgt;
        $this->act=$act;
        $this->pms=$pms;
        $this->data=$crtData;
        $this->page();
        return $this->pageBar;
    }
    private function page()
    {
        if($this->crt<1) {
            $this->crt = 1;
        }
        $this->tot=ceil($this->rowCnt/$this->hgt);
        if( $this->crt > $this->tot){
            $this->crt = $this->tot;
        }
        if($this->crt-1 <= 0){
            $this->pre = false;
        }else{
            $this->pre = $this->crt-1;
        }
        if($this->crt == $this->tot) {
            $this->nxt = false;
        }else{
            $this->nxt = $this->crt+1;
        }
        if($this->tot <= ($this->lft+$this->rgt+1)){
            $cdt['stt'] = 1;
            $cdt['end'] = $this->tot;
            $this->pageBar = $this->make($cdt);
        }else{
            if($this->crt-$this->lft > 0){
                //正常的中间部分
                if($this->crt + $this->rgt < $this->tot){
                    $cdt['stt'] = $this->crt-$this->lft;
                    $cdt['end'] = $this->crt+$this->rgt;
                    $this->pageBar = $this->make($cdt);
                }else{
                    //已经到达最后端
                    $cdt['stt'] = $this->tot-($this->lft+$this->rgt);
                    $cdt['end'] = $this->tot;
                    $this->pageBar = $this->make($cdt);
                }
            }else{
                //已经到达最前端
                $cdt['stt'] = 1;
                $cdt['end'] = $this->lft+$this->rgt+1;
                $this->pageBar = $this->make($cdt);
            }
        }
    }
    /*根据不同的条件获取相应的导航条
     * */
    private function make($cdt)
    {
        $act = $this->act;
        $act .= "?";
        $pageBar = "<ul class='page'>";
        if(false == $this->pre){
            $pageBar .=  '<a class="first denyClick">|<</a>';
            $pageBar .=  '<a class="pre denyClick"><</a>';
        }else{
            $firstUrl = $act.http_build_query(array_merge($this->pms,['tgtPage' => 1]));
            $preUrl = $act.http_build_query(array_merge($this->pms,array('tgtPage' => $this->pre)));
            $pageBar .= "<a  class='first' href='{$firstUrl}'>|<</a>";
            $pageBar .= "<a  class='pre' href='{$preUrl}'><</a>";
        }
        for($i = $cdt['stt']; $i <= $cdt['end']; $i++){
            $nomUrl = $act.http_build_query(array_merge($this->pms,['tgtPage' => $i]));
            if($i == $this->crt){
                $pageBar .= "<a class='atv'  href='{$nomUrl}'>" . $i . "</a>";
            }else{
                $pageBar.= "<a class='nom'  href='{$nomUrl}'>" . $i . "</a>";
            }
        }
        if(false !== $this->nxt){
            $nxtUrl = $act.http_build_query(array_merge($this->pms,['tgtPage' => $this->nxt]));
            $lstUrl = $act.http_build_query(array_merge($this->pms,['tgtPage' => $this->tot]));
            $pageBar.= "<a class='nxt' href='{$nxtUrl}'>></a>";
            $pageBar.= "<a class='lst' href='{$lstUrl}'>>|</a>";
        }else{
            $pageBar.= '<a class="nxt denyClick">></a>';
            $pageBar.= '<a class="lst denyClick">>|</a>';
        }
        $pageBar.= '<a class="tot">'.$this->tot."页</a>";
        $pageBar.="</ul>";
        return $pageBar;
    }
}
