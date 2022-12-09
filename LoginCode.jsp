<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
try
{
String name=request.getParameter("uname");
String password=request.getParameter("password");

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ums","ums");
PreparedStatement ps=con.prepareStatement("select*from uesrreg where name=? and password=?");
ps.setString(1,name);
ps.setString(2,password);
int i=ps.executeUpdate();
ResultSet rs=ps.executeQuery();
if(rs.next())
{
response.sendRedirect("user home.jsp");
}
else
{
out.print("please valid input user name and password");
}
con.close();
}
catch(Exception ex)
{
out.print(ex);
}
%>