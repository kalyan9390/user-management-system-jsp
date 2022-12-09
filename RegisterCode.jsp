
<%@page import="java.sql.*" %>
<%
try
{
String name=request.getParameter("uname");
String password=request.getParameter("password");
String email=request.getParameter("email");
String address=request.getParameter("address");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ums","ums");
PreparedStatement ps=con.prepareStatement("insert into uesrreg values(?,?,?,?)");
ps.setString(1,name);
ps.setString(2,password);
ps.setString(3,email);
ps.setString(4,address);
int i=ps.executeUpdate();
out.print(i+"new user register successfully...");

con.close();
}
catch(Exception ex)
{
out.print(ex);
}
%>