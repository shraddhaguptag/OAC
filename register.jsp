<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

        <div>

            <h3> Choose File to Upload in Server </h3>

            <form action="upload" method="post" enctype="multipart/form-data">
				(1) Course/Subject: <input type="text" name="course"  required="required" /><br><br> 
(2) Rank No.: <input type="text" name="rank"  required="required" /><br><br>
(3) Test Roll No.:<input type="text" name="roll_no"  required="required" /> <br><br>
(4) Application No.:<input type="text" name="app_no"  required="required" /><br> <br> 
(5) Name of Candidate (Mr./Ms)<br>
    (As in HS/SS Certificate)<input type="text" name="candidate_name"  required="required" /><br><br>
(6) Father's Name <input type="text" name="f_name"  required="required" /><br><br>
(7) Mother's Name <input type="text" name="m_name"  required="required" /><br><br>
<br><br>
                Image<input type="file" name="file" /><br><br>

(8) <b>Declaration: I solemny declare on oath that the entries made by me in the above columns are true to the best of my knowledge and belief.</b><br><br> 
<input type="submit" value="Reporting"  />
<input type="reset" value="Reset" />


            </form>         
        </div>
    </body>

</html>