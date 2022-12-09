<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
try
{
String name=request.getParameter("uname");

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ums","ums");
PreparedStatement ps=con.prepareStatement("select*from uesrreg where name=?");
ps.setString(1,name);
ResultSet rs=ps.executeQuery();
ResultSetMetaData rsmd=ps.getMetaData();

out.print("<table border='1'");
int n=rsmd.getColumnCount();

for(int i=1; i<=n; i++){
	out.print("<td>"+"<br>"+rsmd.getColumnName(i));
}
out.print("<tr>");

while(rs.next()){
	for(int i=1; i<=n; i++){
		out.print("<td><br>"+rs.getString(i));
	}
	out.print("<tr>");
   }
out.print("</table></center></body></html>");
con.close();
}
catch(Exception ex)
{
out.print(ex);
}
%>