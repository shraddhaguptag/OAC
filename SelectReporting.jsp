<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/style.css" type="text/css">
<title>Reporting</title>
</head>
<body >
<div>
<%@ include file="header.jsp" %>
</div>

<center>


<table width="500"><tr><td>
<form action="select" method="post" enctype="multipart/form-data">


<fieldset><legend><b>Form1</b></legend>
  <h1>
  <center>
  PERFORMA FOR ADMISSION/CHANCE MEMO REPORTING </center></h1><br><br><br>
  <div class="img" >
    <br><br>
   
(1) Course/Subject: <input type="text" name="course"  required="required" /><br><br> 
(2) Rank No.: <input type="text" name="rank"  required="required" /><br><br>
(3) Test Roll No.:<input type="text" name="roll_no"  required="required" /> <br><br>
(4) Application No.:<input type="text" name="app_no"  required="required" /><br> <br> 
(5) E-mail id: <input type="email" name="email_id" required="required" /> <br><br>
(6) Name of Candidate (Mr./Ms)<br>
    (As in HS/SS Certificate)<input type="text" name="candidate_name"  required="required" /><br><br>
(7) Father's Name <input type="text" name="f_name"  required="required" /><br><br>
(8) Mother's Name <input type="text" name="m_name"  required="required" /><br><br>
(9)Image<input type="file" name="file" /><br><br>

<b>Declaration: I solemny declare on oath that the entries made by me in the above columns are true to the best of my knowledge and belief.</b><br><br> 
<input type="submit" value="Reporting"  />
<input type="reset" value="Reset" />

</div>
</fieldset>
</form>

</td></tr>  
</table>
</center>

<%@ include file="footer.jsp" %>
</body>
</html>