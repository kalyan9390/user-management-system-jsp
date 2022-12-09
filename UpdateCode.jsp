<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
try
{
String name=request.getParameter("uname");
String password=request.getParameter("password");
String email=request.getParameter("email");
String address=request.getParameter("address");

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ums","ums");
PreparedStatement ps=con.prepareStatement("update uesrreg set password=?,email=?,address=? where name=?");
ps.setString(1,password);
ps.setString(2,email);
ps.setString(3,address);
ps.setString(4,name);
int i=ps.executeUpdate();
out.print(i+"new update successfully...");
con.close();
}
catch(Exception ex)
{
out.print(ex);
}
%>