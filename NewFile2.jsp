<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>


<div>
  <h3>Fruits</h3>
  <label>
    <input type="checkbox" class="radio" value="1" name="fooby[1][]" />Kiwi</label>
  <label>
    <input type="checkbox" class="radio" value="1" name="fooby[1][]" />Jackfruit</label>
  <label>
    <input type="checkbox" class="radio" value="1" name="fooby[1][]" />Mango</label>
</div>
<div>
  <h3>Animals</h3>
  <label>
    <input type="checkbox" class="radio" value="1" name="fooby[2][]" />Tiger</label>
  <label>
    <input type="checkbox" class="radio" value="1" name="fooby[2][]" />Sloth</label>
  <label>
    <input type="checkbox" class="radio" value="1" name="fooby[2][]" />Cheetah</label>
</div>
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
</body>
</html>