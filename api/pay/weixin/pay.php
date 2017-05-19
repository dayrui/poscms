<?php

$pay = require WEBPATH.'api/pay/weixin/config.php';
define(APPID, $pay['appid']);
define(MCHID, $pay['mchid']);
define(KEY, $pay['key']);
define(APPSECRET, $pay['appsecret']);
define(JS_API_CALL_URL, SITE_URL.'api/pay/weixin/return_js_url.php');
define(NOTIFY_URL, SITE_URL.'api/pay/weixin/return_url.php');

//使用统一支付接口
require WEBPATH.'api/pay/weixin/WxPayPubHelper/WxPayPubHelper.php';
$unifiedOrder = new UnifiedOrder_pub();

$unifiedOrder->setParameter("body", $title);//商品描述
//自定义订单号，此处仅作举例
$unifiedOrder->setParameter("out_trade_no", $sn);//商户订单号 
$unifiedOrder->setParameter("total_fee", $money * 100);//总金额
$unifiedOrder->setParameter("notify_url", NOTIFY_URL);//通知地址 
$unifiedOrder->setParameter("trade_type", "NATIVE");//交易类型
$unifiedOrder->setParameter("product_id", $id);//商品ID

$notify_url = SITE_URL.'api/pay/weixin/notify_url.php?sn='.$sn;

//获取统一支付接口结果
$unifiedOrderResult = $unifiedOrder->getResult();

//商户根据实际情况设置相应的处理流程
if ($unifiedOrderResult["return_code"] == "FAIL") {
	//商户自行增加处理流程
	echo "通信出错：".$unifiedOrderResult['return_msg'];exit;
} elseif($unifiedOrderResult["result_code"] == "FAIL") {
	//商户自行增加处理流程
	if ($unifiedOrderResult['err_code'] == 'ORDERPAID') {
		$this->pay_model->pay_success($sn, $money, '交易成功');
	}
	echo "错误代码：".$unifiedOrderResult['err_code']."<br>";
	echo "错误代码描述：".$unifiedOrderResult['err_code_des'];
	exit;
} elseif($unifiedOrderResult["code_url"] != NULL) {
	//从统一支付接口获取到code_url
	$code_url = $unifiedOrderResult["code_url"];
	//商户自行增加处理流程
	//......
}

$result['name'] = '微信支付';
$result['html'] = '
	<div align="center" class="pay_info">
		<p>支付单号：'.$sn.'</p>
		<p>支付金额：'.$money.'</p>
	</div>
	<div align="center" id="qrcode" class="pay_qrcode">
	</div>
	<script src="/statics/js/jquery.min.js"></script>
	<script src="/api/pay/weixin/qrcode.js"></script>
	<script>
		function dr_notify() {
			$.ajax({
				type : "post",
				url : "'.$notify_url.'",
				dataType : "jsonp",
				jsonp: "callback",
				jsonpCallback:"success_jsonpCallback",
				success : function(html){
					if (html.status == 1) {
						window.location.href = "'.dr_member_url('pay/index').'";
					}
				},
				error:function(){ }
			});
		}
		$(function(){
			
			// 支付状态检测
			setInterval(\'dr_notify()\', 1000);
			if('.($unifiedOrderResult["code_url"] != NULL).')
			{
				var url = "'.$code_url.'";
				var qr = qrcode(10, \'H\');
				qr.addData(url);
				qr.make();
				var code=document.createElement(\'DIV\');
				code.innerHTML = qr.createImgTag();
				var element=document.getElementById("qrcode");
				element.appendChild(code);
			}
		});
	</script>';