<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<link rel="stylesheet" type="text/css" href="./images/combined.css" charset="GB2312">
<LINK rel="stylesheet" type="text/css" href="./images/thickboxpay.css" charset="GB2312"> 
<script type="text/javascript" src="./images/jquery-1.8.3.js"></script>
<SCRIPT type="text/javascript" src="./images/thickbox.js"></SCRIPT> 
<script type="text/javascript" src="./images/JScript.js"></script>
<title>支付宝付款</title>
<script>
$(document).ready(function() {
		var currentProCode = $("#currentProCode").val();
		var currentTab = $("#tab_" + currentProCode);
		currentTab.addClass("current");
		currentTab.siblings().removeClass("current");
		//var num = $(".select-tab li").index(currentTab);
		var num = currentTab.index();
		$(".contentwrap .paypanel").eq(num).show().siblings().hide();
		tb_show('注意事项','#TB_inline?height=610&width=543&inlineId=TipWindow'); 
	})
</script>
</head>
<body>
<DIV style="DISPLAY: none" id=TipWindow> 
<DIV style="WIDTH: 513px; BACKGROUND: url(./images/tips.jpg); HEIGHT: 600px" class=TipWindow> 
<DIV> 
<UL class="clearfix"> 
<LI><% out.print(request.getParameter("payAmount"));%></LI> 
<LI><% out.print(request.getParameter("title"));%></LI></UL></DIV><A id=cat_Href onclick=tb_remove(); href="#">我已知晓进入下一步》》</A> </DIV></DIV> 
<div class="headwrap">
	<div class="head clearfix">
		<ul>
			<li class="head_logo"><a href="/" target="_blank">网站首页</a></li>
			<li class="head_link"><a href="/" target="_blank">网站首页</a></li>
		</ul>
	</div>
</div>
<!--header结束-->


<div class="content">

                <div class="order">
                    <div class="order_content detail">
                        <ul class="clearfix">
							<li><span>付款金额：</span><strong>￥<% out.print(request.getParameter("payAmount"));%></strong></li>
							<li><span>收款人：</span><strong><% out.print(request.getParameter("optEmail"));%></strong></li>
                            <li><span>付款说明：</span><strong><% out.print(request.getParameter("title"));%></strong> &nbsp;</li>
                        </ul>
                
                        <div class="findetail">
                            <a href="#">转账信息</a>
                        </div>
                    </div>
                </div>
    
		<input type="hidden" id="currentProCode" value="SP000001">

                <div class="select-tab">
                    <ul>
                        <li id="tab_SP000001" class="current"><a href="#">手机支付宝支付</a></li>
                        <li id="tab_SP000002" class=""><a href="#">网页支付宝转账</a></li>
                     </ul>
                </div>
        
		<div class="contentwrap">

              	<div class="paypanel" style="display: block;">
                	<div class="content_left">
  
                       <h4><span>充值流程：确认充值账号后,打开手机支付宝扫描二维码向本站支付宝转账.</span></h4>

						<ul class="clearfix hided">					
                        <li><span>1.首先打开手机支付宝钱包.</span></li>
                        <li><span>2.扫描本站支付宝二维码,并<strong>选择转账功能</strong></span></li>
                        <li><span>3.付款金额填写:<strong><% out.print(request.getParameter("payAmount"));%></strong></span></li>
                        <li><span>4.付款说明填写:<strong><% out.print(request.getParameter("title"));%></strong></span></li>
                        <li><span>温馨提示：请勿修改付款金额付款说明<strong>否则不返数据</strong></span></li>
                        <li><span>到账时间：付款成功后,<strong>耐心等待10秒钟</strong>.</span></li>
                        <li><span><strong>注意事项：</strong>.</span></li>
                        <li><span><strong>1.请正确填写付款说明,否则无法自动到账.</strong>.</span></li>
                        <li><span><strong>2.本站支付宝账户会不定期更换,每次充值前请务必核对支付宝账号.</strong>.</span></li>
						</ul>
                      
                     </div>
                     <div class="content_right_m">
                     <img src="./images/QR.png" style="margin-top:20px; padding-top:20px;margin-left:20px; padding-left:20px">
                     </div>
				</div>
				

				<div class="paypanel" style="display: none;">
                	<div class="content_left">
                		<h4><span>充值流程：确认充值账号后,登录网页支付宝向我们的支付宝转账.</span></h4>
                    
                        <ul class="clearfix">
                            <li><span>1.首先请登录网页支付宝.</span></li>
                            <li><span>2.向本站支付宝账号:<strong><% out.print(request.getParameter("optEmail"));%></strong> 转账
                             <strong>￥<% out.print(request.getParameter("payAmount"));%></strong> 元.</span></li>
                            <li><span>3.付款说明请填写:<strong><% out.print(request.getParameter("title"));%></strong></span></li>
                            <li><span>温馨提示：请勿修改付款金额付款说明<strong>否则不返数据</strong></span></li>
                            <li><span>到账时间：付款成功后,<strong>耐心等待10秒钟</strong>.</span></li>
                            <li><span><strong>注意事项：</strong>.</span></li>
                            <li><span><strong>1.请正确填写付款说明,否则无法自动到账.</strong>.</span></li>
                            <li><span><strong>2.本站支付宝账户会不定期更换,每次充值前请务必核对支付宝账号.</strong></span></li>
                         </ul>
                         <div class="btn"><a target="_blank" href="https://auth.alipay.com/login/index.htm?goto=https://shenghuo.alipay.com/send/payment/fill.htm?title=<% out.print(request.getParameter("title"));%>" id="sino_Href">登录支付宝付款</a></div>
                         
                         
                     </div>
                     <div class="content_right_pc">
			<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="410" height="410" id="alipay" align="middle">
				<param name="movie" value="./images/alipay.swf">
				<param name="quality" value="high">
				<param name="bgcolor" value="#ffffff">
				<param name="play" value="true">
				<param name="loop" value="true">
				<param name="wmode" value="window">
				<param name="scale" value="showall">
				<param name="menu" value="true">
				<param name="devicefont" value="false">
				<param name="salign" value="">
				<param name="allowScriptAccess" value="sameDomain">
				<!--<![endif]-->
			</object>
				<!--[if !IE]>-->
				<object type="application/x-shockwave-flash" data="./images/alipay.swf" width="410" height="410">
					<param name="movie" value="css/img/alipay.swf">
					<param name="quality" value="high">
					<param name="bgcolor" value="#ffffff">
					<param name="play" value="true">
					<param name="loop" value="true">
					<param name="wmode" value="window">
					<param name="scale" value="showall">
					<param name="menu" value="true">
					<param name="devicefont" value="false">
					<param name="salign" value="">
					<param name="allowScriptAccess" value="sameDomain">
				<!--<![endif]-->
					<a href="http://www.adobe.com/go/getflash">
						<img src="./images/get_flash_player.gif" alt="获得 Adobe Flash Player">
					</a>
				<!--[if !IE]>-->
				</object>
                     </div>
				</div>
			
		</div>
</div>


<div id="footer">
	<div class="foot-link">

	</div>
	<div class="copyright">Copyright 2016. All Rights Reserved  </div>
</div>

</body></html>