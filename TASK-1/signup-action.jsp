<%@page import="gen2gen.dbcon.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gen 2 Gen | Sign Up</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
	String name=request.getParameter("name");  
	String email=request.getParameter("email"); 
	String password=request.getParameter("password"); 
	String extra=request.getParameter("extra");
	out.println(name+" "+email+" "+password+" "+extra+"\n");
	try
	{
		Connection con=DBConnection.getCon();
		PreparedStatement ps=con.prepareStatement("insert into geninfo values(?,?,?,?)");
		ps.setString(1,name);
		ps.setString(2,email);
		ps.setString(3,password);
		ps.setString(4,extra);
		int rs=ps.executeUpdate();
		if(rs==1)
		{
			response.sendRedirect("login.html");
		}
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>
</body>
</html>