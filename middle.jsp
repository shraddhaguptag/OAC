<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OAC</title>
</head>

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
<%@ page import="javax.mail.MessagingException"%>
<%@ page import="oacpack.EmailUtility"%>


<body>

<%@ include file="adminheader.jsp" %>
<div><center>
<table width="400"><tr><td>
<form  action="seatallocated.jsp" align="center">


<fieldset><legend><b>Form2</b></legend>
<%


ResultSet rs=null;
String counseling_id =request.getParameter("counseling_id");
try
{
	
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test");
	
	Statement st = con.createStatement();
	
	String query= "select * from oac_select where counseling_id='"+counseling_id+"'"; 
	rs = st.executeQuery(query);
%>
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
<th>Counseling Id :</th>
<th> <input type="text" name="counseling_id" value="<%out.print(rs.getString("counseling_id")); %>"></th>
</tr>
<br>
<tr>
<th>Application Number :</th>
<th> <%out.print(rs.getString(2)); %></th>
</tr>
<br>
<tr>
<th>Roll Number :</th>
<th><%out.print(rs.getString(3)); %></th></tr><br>
<tr>
<th>Course :</th>
<th><%out.print(rs.getString(5)); %></th></tr><br>
<tr>
<th>Rank :</th>
<th><%out.print(rs.getString(4)); %></th></tr><br>
<tr>
<th>Email_id :</th>
<th><%out.print(rs.getString(6)); %></th></tr><br>
<tr>
<th>Name :</th>
<th><%out.print(rs.getString(7)); %></th></tr><br>

	<%
	}
	%>
	 
	<%	
}
catch(Exception ex){
	ex.printStackTrace();
}

%>
<h3>Choose Course/Branch for Student Seat Allocation</h3>
<select name="course" multiple>
  <option value="Civil Engineering">Civil Engineering"</option>
  <option value="Chemical Engineering"">Chemical Engineering"</option>
  <option value="Mechanical Engineering">Mechanical Engineering</option>
  <option value="Computer Engineering">Computer Engineering</option>
</select><br><br><br>
<center>
 <input type="submit" value="submit">
</center>

   
</fieldset>
</form>
</table>

</center>
 </div>   
</body>
</html>