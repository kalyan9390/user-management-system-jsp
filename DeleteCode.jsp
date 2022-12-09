<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
try
{
String name=request.getParameter("uname");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ums","ums");
PreparedStatement ps=con.prepareStatement("delete from uesrreg where name=?");
ps.setString(1,name);
int i=ps.executeUpdate();
out.print(i+"delete successfully");
con.close();
}
catch(Exception ex)
{
out.print(ex);
}
%>