<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<body>
<%@ page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test");
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	PreparedStatement psmt=con.prepareStatement("select * from oac_admin where email=? and password=?");
	psmt.setString(1, email);
	psmt.setString(2, password);
	ResultSet rs=psmt.executeQuery();
	if(rs.next())
	{
		out.println("successfully login:"+rs.getString(1));
	}
	else
	{
		System.out.println("login failed");
%>
 <jsp:include page="adminhome.jsp"/>
<%
	}
%>

</body>
</html>