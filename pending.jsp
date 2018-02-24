<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@ include file="adminheader.jsp" %>
<a href="pending.jsp"><b>Logout</b></a>
<marquee bgcolor="87CEFA"><img src="images/ad.jpg"></marquee>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<body>
<%
ResultSet rs=null;

try
{
	
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test");
	
	Statement st = con.createStatement();
	
	String query= "select * from oac_select where ack='pending'";
	rs = st.executeQuery(query);
%>

	<br><br>
	<table cellspacing="10" cellpadding="10" border="1"> 
	<tr><th> APPLICATION NO.</th><th>ROLL NO.</th><th>COURSE</th><th>RANK</th><th>NAME</th><th>FATHER NAME</th><th>MOTHER NAME</th><th>PHOTO</th><th>APPROVAL</th><th>REJECTED</th></tr> 
	<%

	if(!rs.isBeforeFirst())
	{
	    %>
	        <tr>
	        <td colspan="5"><%out.print("No Files!"); %></td>
	        </tr>
	    <%
	}    

	while(rs.next())
	{ 
		
		
	%>
	    <tr>
	        
	        <td><%out.print(rs.getString(2)); %></td>
	        <td><%out.print(rs.getString(3)); %></td>
	        <td><%out.print(rs.getString(4)); %></td>
	        <td><%out.print(rs.getString(5)); %></td>
	       
	        <td><%out.print(rs.getString(7)); %></td>
	        <td><%out.print(rs.getString(8)); %></td>
	        <td><%out.print(rs.getString(9)); %></td>
	      <td>  <img border="1" src="upload/<%=rs.getString("photo") %>" height="150" width="150" />
	        </td>
	       
	        <td>
	        <a href="approval.jsp?id=<%out.print(rs.getString(1));%>">Approved</a></td>
	    
	     
	     <td>   <a href="reject.jsp?id=<%out.print(rs.getString(1));%>">Rejected</a></td>
	     </tr>
	    
	<%
	}
	%>
	 
	<%	
}
catch(Exception ex){
	ex.printStackTrace();
}

%>
  </table>
</body>
</html>