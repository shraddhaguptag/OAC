<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OAC</title>

</head>
<body>
<%@ include file="header.jsp" %>
<div>
<center>
<div id="ssn">
			<img src="images/images.jpg" alt="Img" class="center" align ="middle"></div>
		
<form  action="dbadminlogin.jsp">  
Email_id: <br><input type="email" name="email"  placeholder="abc@gmail.com" required="required" /><br>  <br> 
Password: <br><input type="password" name="password"  placeholder="password" required="required" /><br> <br>  

<input type="submit" value="Login.."  />
<input type="reset" value="Reset" />
</form>
</center>
</div>
<br><br>
<%@ include file="footer.jsp" %>
</body>
</html>