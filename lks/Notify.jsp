<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*,java.security.*"
    pageEncoding="UTF-8"%><%@ page import="com.mysql.jdbc.Driver" %><%@ include file="Config.jsp"%><%

String tradeNo = isNull(request.getParameter("tradeNo"));
String Money = isNull(request.getParameter("Money"));
String title = isNull(request.getParameter("title"));
String memo = isNull(request.getParameter("memo"));
String alipay_account = isNull(request.getParameter("alipay_account"));
String Gateway = isNull(request.getParameter("Gateway"));
String Sign = isNull(request.getParameter("Sign"));

if(gstGBKMD5(alidirect_pid + alidirect_key + tradeNo + Money + title + memo).toUpperCase().equals(Sign.toUpperCase())) {

	ResultSet rs=stmt.executeQuery("select * from 订单表 where 订单号=" + title);
	if(rs == null) {
		out.print("IncorrectOrder"); //订单不存在
		return;
	}
	while(rs.next())
	{
		if(rs.getString("订单金额字段")!=Money)//实际支付金额不匹配
		{
				out.print("fail");
				return;
		}
		else
		{
			if(rs.getString("订单状态")=="0")//判断订单未处理过
			{
				String username = rs.getString("username");//从之前保存的订单中读取付款用户名
				stmt.executeUpdate("update 订单表 set 支付宝交易号字段=$tradeNo,订单状态 = '1' where 订单号="+title);//记录支付宝交易号，并修改交易状态为成功（status=1）
				stmt.executeUpdate("update 用户表 set 余额字段 = 余额字段 + $Money where 用户名字段="+username);//以收到的Money为准给用户增加金额，如果是购物车订单结算可不需要这一步
			}
			out.print("Success");//支付成功
			return;
		}
	}
	rs.close();
	stmt.close();
	conn.close();
}
else {
	out.print("Fail");
	return;
}
%>
<%!
public static String isNull(String str) {
	if(str == null || str == "") { 
		 return "";
	} 
	else {
		return str;
	}
}
%>
<%!
public static String MD5(String s) {  
        char hexDigits[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};         
        try {  
            byte[] btInput = s.getBytes();  
            // 获得MD5摘要算法的 MessageDigest 对象  
            MessageDigest mdInst = MessageDigest.getInstance("MD5");  
            // 使用指定的字节更新摘要  
            mdInst.update(btInput);  
            // 获得密文  
            byte[] md = mdInst.digest();  
            // 把密文转换成十六进制的字符串形式  
            int j = md.length;  
            char str[] = new char[j * 2];  
            int k = 0;  
            for (int i = 0; i < j; i++) {  
                byte byte0 = md[i];  
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];  
                str[k++] = hexDigits[byte0 & 0xf];  
            }  
            return new String(str);  
        } catch (Exception e) {  
            e.printStackTrace();  
            return null;  
        }  
    }  
	public String gstGBKMD5(String txt) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(txt.getBytes("GBK"));
			StringBuffer buf = new StringBuffer();
			for (byte b : md.digest()) {
				buf.append(String.format("%02x", b & 0xff));
			}
			return buf.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
    %>