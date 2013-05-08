<?php
/**
 * @copyright 2007-2008 Naoya Shimada
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_yahoomap extends OpenPNE_Action
{
    function handleError()
    {
        openpne_redirect('pc', 'page_h_home');
    }

    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $encoding = 'UTF-8';
        $p = urldecode($requests['p']);
        $p = mb_convert_encoding($p,$encoding,"auto");
        $lat = $requests['lat'];
        $lon = $requests['lon'];
        $type = $requests['type'];
        $lnm = urldecode($requests['lnm']);
        $lnm = mb_convert_encoding($lnm,$encoding,"auto");
        $idx = $requests['idx'];
        $mode = $requests['mode'];
        $layer = $requests['layer'];
        $memo = urldecode($requests['memo']);
        $memo = mb_convert_encoding($memo,$encoding,"auto");
        $rsmode = $requests['rsmode'];
        // ----------
        //$lat = $this->changeDofunbyou2Do($lat);
        //$lon = $this->changeDofunbyou2Do($lon);
        $layer = (!isset($layer) || empty($layer) || (intval($layer) < 1 || intval($layer) > 10)) ? 3 : $layer;
        $name = preg_replace('`(\d)\/(?=\d)`', '$1', $lat.$lon); 
        $name = preg_replace('`(\d)\.(?=\d)`', '$1', $name);
        // ----------
        $this->set('p', $p);
        $this->set('lat', $lat);
        $this->set('lon', $lon);
        $this->set('type', $type);
        $this->set('lnm', $lnm);
        $this->set('idx', $idx);
        $this->set('mode', $mode);
        $this->set('layer', $layer);
        $this->set('memo', $memo);
        $this->set('rsmode', $rsmode);
        $this->set('name', $name);

        $this->set('OPENPNE_URL', OPENPNE_URL);
        $this->set('SNS_NAME', SNS_NAME);

        $view =& $this->getView();
        $view->ext_display('h_yahoomap.tpl');
        exit;
    }

    function changeDofunbyou2Do($val = ''){
        if ( strlen($val) > 0 ) {
            if ( preg_match('/^[0-9]{1,3}\.?[0-9]+$/',$val) ) {
                return $val;
            } else {
                $val = preg_replace('`(\d)\/(?=\d)`', '$1.', $val); 
                $tmp = explode ( '.' , $val );
                if ( count($tmp) > 3 ) {
                    $ret = strval(intval($tmp[0]) + ((intval($tmp[1]) * 60 + floatval($tmp[2] . "." . $tmp[3])) * 1000) / 3600000);
                } elseif ( count($tmp) == 3 ){
                    $ret = strval(intval($tmp[0]) + ((intval($tmp[1]) * 60 + intval($tmp[2])) * 1000) / 3600000);
                } 
                else {
                    $ret = strval(intval($tmp[0]) + (intval($tmp[1]) * 60 * 1000) / 3600000);
                }
                return $ret;
            }
        }
    }

    function changeDo2Dofunbyou($val = ''){
        if ( strlen($val) > 0 ) {
            if ( preg_match('/^[0-9]{1,3}\.?[0-9]+$/',$val) ) {
                $tmp = explode ( '.' , $val );
                if ( count($tmp) > 1 ) {
                    $milisec = floatval('0.'.$tmp[1]) * 3600000;
                    $tmp2 = explode('.',strval($milisec / 60000));
                    $tmp[1] = $tmp2[0];
                    $tmp[2] = strval($milisec / 1000 - intval($tmp[1]) * 60);
                    return implode('.',$tmp);
                } else{
                    return $val . '.0.0.0';
                }
            } else {
                return $val;
            }
        }
    }
}

?>
