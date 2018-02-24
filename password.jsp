<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="adminheader.jsp" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
String a=request.getParameter("t1");
String b=request.getParameter("t2");
String c=request.getParameter("t3");
String n=request.getParameter("t4");
String password = "";
String email ="";

try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test");
PreparedStatement psmt=con.prepareStatement("select * from oac_admin where email=?");
psmt.setString(1,n);
ResultSet rs = psmt.executeQuery();
if(rs.next()) { 
	password = rs.getString("password");
email=rs.getString("email");
} 
if(email.equals(n)&& password.equals(a)){
if(b.equals(c))
{
psmt = con.prepareStatement("update oac_admin set password=?  where email=?");
psmt.setString(1,b);
psmt.setString(2,n);
int i = psmt.executeUpdate();
out.println("Password changed successfully");
psmt.close();
con.close();
} else {
out.println("Old Password doesn't match");
}

}
} catch (Exception e) {
out.println(e);
}
%>
</body>
<%@ include file="footer.jsp" %>
</html>