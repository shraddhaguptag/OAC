<html >
<head>
<title>Form Example</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
</head>

<body>
<select id="_go">
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
</select>

<select id="_gogo">
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
</select>

<select id="_gogogo">
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
</select>

<script type="text/javascript">
var $select = $("select[id$='go']");
$select.on('change',function() {
   
	 $select .not(this);
      $select .find('option');
       $select.prop('disabled', '');
       $select.filter('[value='+this.value+']');
       $select.prop('disabled','disabled');
});
$select.eq(0).trigger('change');

</script>

</body>
</html>

   
  





 
