<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="adminheader.jsp" %>
<script>
function validate(){
	
	var pas= f1.t2.value;
	var cpas=f1.t3.value;
	
	
	if (pas!=cpas)
		{
		alert("wrong");
		return false;
	
		}
	}

</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>


<form method="post" action="password.jsp" name="f1" onsubmit="return validate()">  

Email:<br><input type="text" name="t4" /><br><br>
Old_Password: <br><input type="password" name="t1"  placeholder="**" required="required" /><br>  <br> 
New_Password: <br><input type="password" name="t2" placeholder="**" required="required" /><br> <br>   	   
Confirm_Password:<br><input type="password" name="t3" placeholder="***" required="required"><br><br>
  
<input type="submit" value="Change"  /><br><br>
<input type="reset" value="Reset" />
</center>
</form>  

</body>
<%@ include file="footer.jsp" %>
</html>