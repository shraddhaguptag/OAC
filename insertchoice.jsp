<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@ include file="header.jsp" %>
<body>
<%@page import="java.sql.*"%>
<form action="datasuccess.jsp">
<%
String choices="";
String fooby[]=request.getParameterValues("fooby[1][]");
for(int i=0;i<fooby.length;i++){
	choices+=fooby[i]+" ";
}

        try{
        	String counseling_id=request.getParameter("counseling_id");
        	String rank=request.getParameter("rank");
        	String Chemical_Engineering=request.getParameter("Chemical_Engineering");
        	
        	String Mechanical_Engineering=request.getParameter("Mechanical_Engineering");
        	String Computer_Engineering=request.getParameter("Computer_Engineering");
        	String Civil_Engineering=request.getParameter("Civil_Engineering");
        	String Electronics_Engineering=request.getParameter("Electronics_Engineering");
        	
        	Class.forName("com.mysql.jdbc.Driver");
        	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test");


        	PreparedStatement psmt=(PreparedStatement) conn.prepareStatement("insert into oac_choice values(?,?,?,?,?,?,?)");
        	psmt.setString(1,counseling_id);
    		psmt.setString(2,rank);
    		psmt.setString(3,choices);
    		psmt.setString(4,choices);
    		psmt.setString(5,choices);
    		psmt.setString(6,choices);
    		psmt.setString(7,choices);
        	out.println("Your Choice is Successfully inserted. Please wait for Seat allocation by admin.");
        }
        catch(Exception e){
        System.out.println(e);
        }
        %>
</form>
</body>
<%@ include file="footer.jsp" %>
</html>