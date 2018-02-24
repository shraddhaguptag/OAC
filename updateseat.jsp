<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OAC</title>
</head>
<body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%
String sub =request.getParameter("course");
String seats=(request.getParameter("seats"));

try {
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test");
	
	System.out.println(sub);
	System.out.println(seats);
	  String query2= "update oac_seat set total_seats=? where branch= ? ";
      PreparedStatement psmt = con.prepareStatement(query2);
      psmt.setString(1, seats); // set input parameter 1
      psmt.setString(2, sub); // set input parameter 2
      int i =  psmt.executeUpdate(); // execute update statement

      if(i > 0)
      {
      out.print("Record Updated Successfully");
      }
      else
      {
      out.print("There is a problem in updating Record.");
      } 
      System.out.println("shr");   

      }
catch (Exception ex) {
out.println("Unable to connect to database.");

   }
		
%>
</body>
</html>