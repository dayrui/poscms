<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/* v3.1.0  */

class Test extends M_Controller {

    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
        $this->output->enable_profiler(FALSE);
    }



    public function bbs () {

        $bbs = $this->load->database((string) 'bbs', TRUE);
        $row = $bbs->query("select * from pre_forum_post order by pid desc limit 1")->row_array();
        $id = intval($row['pid']);
        for ($i=1;$i<9999999; $i++) {
            $id++;
        $bbs->query("INSERT INTO `discuz`.`pre_forum_post` (`pid`, `fid`, `tid`, `first`, `author`, `authorid`, `subject`, `dateline`, `message`, `useip`, `port`, `invisible`, `anonymous`, `usesig`, `htmlon`, `bbcodeoff`, `smileyoff`, `parseurloff`, `attachment`, `rate`, `ratetimes`, `status`, `tags`, `comment`, `replycredit`, `position`) VALUES (".$id.", '2', '1', '1', 'admin', '1', 'adsfasdf2222', '1457335975', 'asdfasdfasdf
22222222', '127.0.0.1', '65215', '0', '0', '1', '0', '-1', '-1', '0', '0', '0', '0', '0', '', '0', '0', NULL)");
        }

    }

    /**
     *
     */
    public function index() {

       $this->template->display('test.html');
    }

    function listDir($dir)
    {
        if(is_dir($dir))
        {
            if ($dh = opendir($dir))
            {
                while (($file = readdir($dh)) !== false)
                {
                    if((is_dir($dir."/".$file)) && $file!="." && $file!="..")
                    {
                        $this->listDir($dir."/".$file."/");
                    }
                    else
                    {
                        if($file!="." && $file!="..")
                        {
                            $ext = end(explode('.', $file));
                            if (in_array($ext, array('php', 'html'))) {
                                $body = file_get_contents($dir."/".$file);
                                if (strpos($body, $this->preg) !== false) {
                                    // 替换
                                    $body = str_replace($this->preg, $this->value, $body);
                                    file_put_contents($dir."/".$file, $body);
                                }

                            }
                        }
                    }
                }
                closedir($dh);
            }
        }
    }
}

