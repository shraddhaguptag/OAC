<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@ include file="adminheader.jsp" %>
<a href="logout.jsp"><b>Logout</b></a>
<marquee bgcolor="87CEFA"><img src="images/ad.jpg"></marquee>

<body>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<h1><center>Seat Updation</center></h1>
<table border="1" align="center">
<tr>
<td>Branch</td>
<td>Total Seat</td>
<td>update</td>
</tr>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test");
	Statement st = con.createStatement();
	ResultSet rs=null;
String sql ="select * from oac_seat";
rs = st.executeQuery(sql);
while(rs.next()){
%>
<tr>
<td><%=rs.getString("Branch") %></td>
<td><%=rs.getString("Total_Seats") %></td>
<td><a href="seatupdate.jsp?branch=<%=rs.getString("branch")%>">Update</a></td>
</tr>
<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

</body>
<%@ include file="footer.jsp" %>
</html>