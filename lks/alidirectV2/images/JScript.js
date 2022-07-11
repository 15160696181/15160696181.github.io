$(document).ready(function() {
	$(".paypanel label").click(function() {
		$(".paypanel label").each(function() {
			jQuery(this).removeClass("select")
		});
		$(this).addClass("select").siblings().attr("checked", true);
	});
	$(".paypanel input[type='radio']").click(function() {
		$(".paypanel label").each(function() {
			jQuery(".paypanel label").removeClass("select")
		});
		$(this).siblings().addClass("select");
	})
	
	
	
	$(".select-tab li").click(function() {
		$(this).addClass("current");
		$(this).siblings().removeClass("current");
		var num = $(".select-tab li").index(this);
		$(".contentwrap .paypanel").siblings().hide();
		$(".contentwrap .paypanel").eq(num).show().siblings().hide();
	});
	



	
});
// JScript 文件

//select option
function handleOption(selId,hidId) {
	//初始化赋值操作
	doInitOption(selId,hidId);
	$("#" + selId).bind("change",function(){
		doInitOption(selId,hidId);
	});
	
}

function doInitOption(selId,hidId) {
	$("#" + selId + " > option").each(function (){
		if ($(this).attr("selected") == "selected") {
			$("#" + hidId).val($(this).val());
		} ;
	});
}

var flag = false;
function choseBank(bankCode, bankName, bankType,subPrdCode) {
	//alert("bankCode：" + bankCode + ",bankName:" + bankName + ",bankType:" + bankType);
	$("#bankCode").val(bankCode);
	$("#bankName").val(bankName);
	$("#bankType").val(bankType);
    $("#subPrdCode").val(subPrdCode);

}
function choseUnionBank(values, name, remark) {
	$("#hid_bankco").val(values);
	$("#hid_bankname").val(escape(name));
	$("table[id$='table']").css('display', 'none')
	var tableName = '#' + values + remark + 'table';
	$(tableName).css('display', '');
}
function CheckSelect() {
	if ($("#bankCode").val() == "") {
		alert("请选择支付银行");
		return false;
	} else {
		return true;
	}
}
