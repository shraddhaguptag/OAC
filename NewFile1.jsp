<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ include file="header.jsp" %>
<form><table align="center" cellspacing="15"><tr>
<th>Application Number :</th>
<th><%= session.getAttribute("app_no") %></th></tr><br>
<tr>
<th>Roll Number :</th>
<th><%= session.getAttribute("roll_no") %></th></tr><br>
<tr>
<th>Course :</th>
<th><%= session.getAttribute("course") %></th></tr><br>
<tr>
<th>Rank :</th>
<th><%= session.getAttribute("rank") %></th></tr><br>
<tr>
<th>Email_id :</th>
<th><%= session.getAttribute("email_id") %></th></tr><br>
<tr>
<th>Name :</th>
<th><%= session.getAttribute("name") %></th></tr><br>
<tr>
<th>Father Name :</th>
<th><%= session.getAttribute("f_name") %></th></tr><br>
<tr>
<th>Mother Name :</th>
<th><%= session.getAttribute("m_name") %></th></tr><br>
<tr>
<th>Photo :</th>
<th><img src="upload/<%=request.getSession().getAttribute("photo")%>" style="width:10%" "height:10%" /></th></tr><br><br><br>

<tr><td><center><input type="checkbox" name="agree" value="agree" > I Agree to All terms of AMU Engineering Reporting <br></center></td></tr>
<tr><td><a href="welcome.jsp">Submit</a></td></tr>

</table>
</form>



<%@ include file="footer.jsp" %>

</body>
</html>