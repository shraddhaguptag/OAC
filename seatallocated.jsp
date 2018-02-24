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
<div>
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

String counseling_id =request.getParameter("counseling_id");

String courses=" ";
String[] course = request.getParameterValues("course");
for(int i=0; i<course.length; i++){
	courses+=course[i]+" ";
}



String host;
String port;
String user;
String pass;
//    // reads SMTP server setting from web.xml file
    ServletContext context = getServletContext();
   host = context.getInitParameter("host");
    port = context.getInitParameter("port");
    user = context.getInitParameter("user");
    pass = context.getInitParameter("pass");

    String name;
    String email;
    String recipient="shwetavarshney2194@gmail.com";
     String subject="False";
    String content="False";   
    try {
    	Class.forName("com.mysql.jdbc.Driver");
    	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test");
    	
    	  
    	  String query2= "select * from oac_select where counseling_id='"+counseling_id+"'"; 
          PreparedStatement psmt = con.prepareStatement(query2);
         	
    		ResultSet rs = psmt.executeQuery(); 
    		
          if(rs.next()){
    																							
          	name = rs.getString("candidate_name");
          email = rs.getString("email_id");
          recipient = email;
           subject = "AMU, Counseling Approval !!!";
            content ="Hello "+name+", \n Your seat allocated to Branch: "+courses+"is approved.\nBy: AMU Counseling ";   
          }





     
 
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test");


PreparedStatement pstmt = null;
String query = "update oac_allo set counseling_id=?,course=? where counseling_id="+counseling_id;
pstmt = conn.prepareStatement(query); // create a statement
pstmt.setString(2,courses);
pstmt.setString(1,counseling_id);
int i = pstmt.executeUpdate(); // execute update statement
if(i>0) {
	
System.out.println("courses");
out.println("Seat allocated successfully and e-mail sent to the candidate.");

}
else{
out.print("not");
}

try {
    EmailUtility.sendEmail(host, port, user, pass, recipient, subject, content);          
    } catch (Exception ex) {
       ex.printStackTrace();          
    }    
    } catch (Exception e) {
        e.printStackTrace();
        System.exit(1);
      } 






 		
     

%>
</div>
</body>
<%@ include file="footer.jsp" %>
</html>