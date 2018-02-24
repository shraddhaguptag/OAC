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
<center>
<form action="photo" method="post" enctype="multipart/form-data" >

<table width="500"><tr><td>



<fieldset><legend><b>Form2</b></legend>
  <h1>
  <center>
  Upload Photo For Step-2 </center></h1><br><br><br>
  id <input type="text" name="id"  required="required" /><br><br>
  <div class="pho" >
   Image<br>
   
   
   <input type="file" name="photo" /><br><br>
  
    <br><br>
      <input type="submit" value="upload" />
    <br><br>
    </div>
   </fieldset>
</form>

</td></tr>  
</table>
</center>
    
<%@ include file="footer.jsp" %>

</body>
</html>