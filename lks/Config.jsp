<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%
String alidirect_account = "sales@zfbjk.com";
String alidirect_pid = "10001";
String alidirect_key = "bfb32705487e10a942526c5c5450e741";

String driverClass="com.mysql.jdbc.Driver";
Class.forName(driverClass);
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbname?useUnicode=true&amp;characterEncoding=UTF-8","dbuser","dbpass");
Statement stmt=conn.createStatement();
%>