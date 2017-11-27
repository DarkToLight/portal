<?php
namespace Home\Controller;
use Think\Controller;
use Think\Upload;

class UploadController extends Controller {
    public function up()
    {
        $config = C('FILE_UPLOAD_CONFIG');
        //附带的信息
        $request_data = I('post.');
        $member_id = $request_data['member_id'];
        if(empty($the_file_usage)){
            $the_file_usage = $file_usage['DOWNLOAD'];
        }
        $file_info['member_id'] = $member_id;
        $file_info['created_time'] = time();

        // 上传文件

        //实例化上传类，传入上面的配置数组
        $uploader = new Upload($config, 'Local');
//            $uploader->saveName = $file_uuid;
        $info = $uploader->upload($_FILES);
        //这里判断是否上传成功
        if ($info) {
            //// 上传成功 获取上传文件信息
            foreach ($info as &$file) {
                //拼接出上传目录
                $file['rootpath'] = __ROOT__ . ltrim($config['rootPath'], ".");
                //拼接出文件相对路径
                $file['filepath'] = $file['rootpath'] . $file['savepath'] . $file['savename'];
            }
            //这里可以输出一下结果,相对路径的键名是$info['upload']['filepath']
            $filepath = $file['filepath'];
            $file_info['file_path'] = $filepath;

            $return_data['error'] = '文件上传成功';
            $return_data['img_path'] = $filepath;

            $this->ajaxReturn($return_data);
        } else {
            $error_msg = $uploader->getError();
            $return_data['error'] = $error_msg;
            $this->ajaxReturn($return_data);
        }
    }
}