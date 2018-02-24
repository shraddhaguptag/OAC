<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@ include file="header.jsp" %>
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






<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
$("input:checkbox").on('click', function() {
	  // in the handler, 'this' refers to the box clicked on
	  var $box = $(this);
	  if ($box.is(":checked")) {
	    // the name of the box is retrieved using the .attr() method
	    // as it is assumed and expected to be immutable
	    var group = "input:checkbox[name='" + $box.attr("name") + "']";
	    // the checked state of the group/box on the other hand will change
	    // and the current value is retrieved using .prop() method
	    $(group).prop("checked", false);
	    $box.prop("checked", true);
	  } else {
	    $box.prop("checked", false);
	  }
	});

</script>

<center><div>

<form name="radioForm"  action="insertchoice.jsp" align="center">


<fieldset><legend><b>Form2</b></legend>
<table width="500">
  <h1><center>CHOICE FILLING </center></h1><br>
<tr>
1.Counseling_id.<br>
<input type="text" name="counseling_id"  required="required" /><br><br>
2. Rank in all branches(S001,CE014 )<br>
<input type="text" name="rank"  required="required" /><br><br>
 <h2><b>Preference of Branches</b></h2>
 </tr><tr>

  <h3>Chemical Engineering</h3>
  <label>
    <input type="checkbox" class="radio" value="Choice 1" name="fooby[1][]" />Choice 1</label>
  <label>
    <input type="checkbox" class="radio" value="Choice 2" name="fooby[1][]" />Choice 2</label>
  <label>
    <input type="checkbox" class="radio" value="Choice 3" name="fooby[1][]" />Choice 3</label>
     <label>
      <input type="checkbox" class="radio" value="Choice 4" name="fooby[1][]" />Choice 4</label>
       <label>
      <input type="checkbox" class="radio" value="Choice 5" name="fooby[1][]" />Choice 5</label>
  </tr>     
   <tr>
<h3>Mechanical Engineering</h3>
  <label>
    <input type="checkbox" class="radio" value="Choice 1" name="fooby[2][] " />Choice 1</label>
  <label>
    <input type="checkbox" class="radio" value="Choice 2" name="fooby[2][]" />Choice 2</label>
  <label>
    <input type="checkbox" class="radio" value="Choice 3" name="fooby[2][]" />Choice 3</label>
     <label>
     <input type="checkbox" class="radio" value="Choice 4" name="fooby[2][]" />Choice 4</label>
     <label>
     <input type="checkbox" class="radio" value="Choice 5" name="fooby[2][]" />Choice 5</label>
   </tr><tr>
  <h3>Computer Engineering</h3>
  <label>
    <input type="checkbox" class="radio" value="Choice 1" name="fooby[3][]" />Choice 1</label>
  <label>
    <input type="checkbox" class="radio" value="Choice 2" name="fooby[3][]" />Choice 2</label>
  <label>
    <input type="checkbox" class="radio" value="Choice 3" name="fooby[3][]" />Choice 3</label>
     <label>
     <input type="checkbox" class="radio" value="Choice 4" name="fooby[3][]" />Choice 4</label>
     <label>
     <input type="checkbox" class="radio" value="Choice 5" name="fooby[3][]" />Choice 5</label>
   </tr><tr>

<h3>Civil Engineering</h3>
  <label>
    <input type="checkbox" class="radio" value="Choice 1" name="fooby[4][]" />Choice 1</label>
  <label>
    <input type="checkbox" class="radio" value="Choice 2" name="fooby[4][]" />Choice 2</label>
  <label>
    <input type="checkbox" class="radio" value="Choice 3" name="fooby[4][]" />Choice 3</label>
    <label>
     <input type="checkbox" class="radio" value="Choice 4" name="fooby[4][]" />Choice 4</label>
     <label>
     <input type="checkbox" class="radio" value="Choice 5" name="fooby[4][]" />Choice 5</label>
     </tr><tr>
  <h3>Electronics Engineering</h3>
  <label>
    <input type="checkbox" class="radio" value="Choice 1" name="fooby[5][]" />Choice 1</label>
  <label>
    <input type="checkbox" class="radio" value="Choice 2" name="fooby[5][]" />Choice 2</label>
  <label>
    <input type="checkbox" class="radio" value="Choice 3" name="fooby[5][]" />Choice 3</label>
     <label>
      <input type="checkbox" class="radio" value="Choice 4" name="fooby[5][]" />Choice 4</label>
       <label>
      <input type="checkbox" class="radio" value="Choice 5" name="fooby[5][]" />Choice 5</label>
      <script type="text/javascript">
$("input:checkbox").on('click', function() {
	  // in the handler, 'this' refers to the box clicked on
	  var $box = $(this);
	  if ($box.is(":checked")) {
	    // the name of the box is retrieved using the .attr() method
	    // as it is assumed and expected to be immutable
	    var group = "input:checkbox[name='" + $box.attr("name") + "']";
	    // the checked state of the group/box on the other hand will change
	    // and the current value is retrieved using .prop() method
	    $(group).prop("checked", false);
	    $box.prop("checked", true);
	  } else {
	    $box.prop("checked", false);
	  }
	});


      </script>
   </tr>
<tr>
<br><br>
<input type="submit" value="submit" >
</tr></table>
</fieldset>
</form>
  </div>
</center>


</body>
<%@ include file="footer.jsp" %>
</html>