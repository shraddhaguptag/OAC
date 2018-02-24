<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page import="javax.mail.MessagingException"%>
<%@ page import="oacpack.EmailUtility"%>

<%
 String host;
 String port;
 String user;
 String pass;
//     // reads SMTP server setting from web.xml file
     ServletContext context = getServletContext();
    host = context.getInitParameter("host");
     port = context.getInitParameter("port");
     user = context.getInitParameter("user");
     pass = context.getInitParameter("pass");
     String did =request.getParameter("id");


String name;
String email;
String recipient="shwetavarshney2194@gmail.com";
 String subject="False";
String content="False";   
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test");
	
	  
	  String query2= "select * from oac_select where counseling_id='"+did+"'"; 
      PreparedStatement psmt = con.prepareStatement(query2);
     	
		ResultSet rs = psmt.executeQuery(); 
		
      if(rs.next()){
																							
      	name = rs.getString("candidate_name");
      email = rs.getString("email_id");
      recipient = email;
       subject = "AMU, Counseling Approval !!!";
        content ="Hello "+name+", \n Your application for Counseling in B.tech is rejected.\n By: AMU Counseling ";   
      }
	  
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test");


PreparedStatement pstmt = null;
String query = "update oac_select set ack = ? where counseling_id = ? ";
pstmt = con.prepareStatement(query); // create a statement
pstmt.setString(1, "rejected"); // set input parameter 1
pstmt.setString(2, did); // set input parameter 2
pstmt.executeUpdate(); // execute update statement
try {
    EmailUtility.sendEmail(host, port, user, pass, recipient, subject, content);          
    } catch (Exception ex) {
       ex.printStackTrace();          
    }    

System.out.println("ddfg");

out.println("counseling is rejected successfully..../n and e-mail sent to the candidate.");

 		
    } catch (Exception e) {
      e.printStackTrace();
      System.exit(1);
    } 

%>




</body>
</html>