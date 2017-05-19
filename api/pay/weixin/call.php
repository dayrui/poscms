<?php

$pay = require WEBPATH.'api/pay/weixin/config.php';
define(APPID, $pay['appid']);
define(MCHID, $pay['mchid']);
define(KEY, $pay['key']);
define(APPSECRET, $pay['appsecret']);
define(JS_API_CALL_URL, SITE_URL.'api/pay/weixin/return_js_url.php');
define(NOTIFY_URL, SITE_URL.'api/pay/weixin/return_url.php');

if (DR_PAY_FILE == 'return') {
    //使用native通知接口
	require WEBPATH.'api/pay/weixin/WxPayPubHelper/WxPayPubHelper.php';
	$nativeCall = new NativeCall_pub();
	//接收微信请求
	$xml = $GLOBALS['HTTP_RAW_POST_DATA'];
	$nativeCall->saveData($xml);
	if($nativeCall->checkSign() == FALSE){
		$nativeCall->setReturnParameter("return_code","FAIL");//返回状态码
		$nativeCall->setReturnParameter("return_msg","签名失败");//返回信息
	}else{
		//【支付成功】
		$sn = $nativeCall->data["out_trade_no"];
		$money = $nativeCall->data["total_fee"];
		$transaction_id = $nativeCall->data["transaction_id"];
		//使用统一支付接口
		$unifiedOrder = new UnifiedOrder_pub();
		$nativeCall->setReturnParameter("return_code","SUCCESS");//返回状态码
		$nativeCall->setReturnParameter("result_code","SUCCESS");//业务结果
		$this->pay_model->pay_success($sn, number_format($money/100, 2, '.', ''), '交易号：'.$transaction_id);
	}
	//将结果返回微信
	$returnXml = $nativeCall->returnXml();
	echo $returnXml;
} elseif (DR_PAY_FILE == 'return_js') {
    //使用native通知接口
	
} else {
	// 查询支付状态，并返回到扫码页面
	$sn = $this->input->get('sn');
	list($a, $id, $uid, $module, $order) = explode('-', $sn);
	// 查询支付记录 
	$data = $this->db->where('id', $id)->limit(1)->get('member_paylog')->row_array();
	$callback = $_GET['callback'];
	if ($data['status']) {
		echo $callback.'('.json_encode(array('status' => 1)).')';
	} else {
		echo $callback.'('.json_encode(array('status' => 0)).')';
	}
}