   <?php
    include_once('RabbitMQCommand.php');
    include_once('DBCtl.class.php');
    $configs = include_once('Rabbit.conf.php');
    $conf = include_once "DB.conf.php";
    $db = new DBCtl($conf);
    $exchange_name = 'class-e-1';
    $queue_name = 'dftQu_FanYa';
    $route_key = 'class-r-1';
    $ra = new RabbitMQCommand($configs, $exchange_name, $queue_name, $route_key);
    class A{
        private $db;
        public function __construct($db)
        {
            $this->db = $db;
        }

        public function formatDate($jsonDate)
        {
            if (!empty($jsonDate)) {
                preg_match('/\d{10}/',$jsonDate,$matches);
                return date('Y-m-d H:i:s',$matches[0]);
            }
            return '';
        }
        function processMessage($envelope, $queue) {
            $msg = json_decode($envelope->getBody());
            $data['flight_id'] = $msg[0]->FLIGHTID;
            $data['airways'] = $msg[0]->AIRWAYS; # 航空公司二字代码
            $data['flight_no'] = $msg[0]->FLIGHTNO; # 飞行路线编号
            $data['craft_no'] = $msg[0]->CRAFTNO; # 飞机编号
            $data['start_station_cn'] = $msg[0]->STARTSTATIIONCN; # 始发地
            $data['terminal_station_cn'] = $msg[0]->TERMINALSTATIONCN; # 目的地
            $data['isoffin'] = $msg[0]->ISOFFIN; # 进站 A 出站 D
            $data['attribute'] = $msg[0]->ATTRIBUTE; # 航班类型中文描述
            $data['craft_site'] = $msg[0]->CRAFTSITE; # 登机位
            $data['exec_date'] = $this->formatDate($msg[0]->EXECDATE); # 航班执行日期
            $data['start_scheme_takeoff_time'] = $this->formatDate($msg[0]->STARTSCHEMETAKEOFFTIME); # 计划起飞时间
            $data['start_alter_ate_takeoff_time'] = $this->formatDate($msg[0]->STARTALTERATETAKEOFFTIME); # 预计起飞时间
            $data['start_alter_ate_takeoff_time'] = $this->formatDate($msg[0]->STARTALTERATETAKEOFFTIME); # 实际起飞时间

            $data['terminal_scheme_landin_time'] = $this->formatDate($msg[0]->TERMINALSCHEMELANDINTIME); # 计划到达时间
            $data['terminal_real_landin_time'] = $this->formatDate($msg[0]->TERMINALREALLANDINTIME); # 预计到达时间
            $data['terminal_alter_ate_landin_time'] = $this->formatDate($msg[0]->TERMINALALTERATELANDINTIME); # 实际到达时间



            $envelopeID = $envelope->getDeliveryTag();
            $this->db->insert('wp_flight',$data);
            //$pid = posix_getpid();
            //file_put_contents("log{$pid}.log", $msg.'|'.$envelopeID.''."\r\n",FILE_APPEND);

            $queue->ack($envelopeID);
        }
    }
    $a = new A($db);
    $s = $ra->run(array($a,'processMessage'),false);
