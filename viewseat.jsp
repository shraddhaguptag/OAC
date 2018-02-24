<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@ include file="header.jsp" %>

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
	
	String query= "select * from oac_seat";
	rs = st.executeQuery(query);
%>

	<br><br>
	<table cellspacing="10" cellpadding="10" border="1" align="center"> 
	<tr><th>BRANCH</th><th>REMAINING SEAT</th></tr> 
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
	        
	        <td><%out.print(rs.getString(1)); %></td>
	        <td><%out.print(rs.getString(2)); %></td>
	        
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

<%@ include file="footer.jsp" %>

</body>
</html>