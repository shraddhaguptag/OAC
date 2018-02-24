<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String branch = request.getParameter("branch");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "test";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from oac_seat where Branch="+branch;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
<h1>Update data from database in JSP</h1>
<form method="post" action="seatupprocess.jsp">
 <input type="hidden" name="branch" value="<%=resultSet.getString("branch") %>">
<input type="text" name="branch" value="<%=resultSet.getString("branch") %>">
<br>
<br>
 Branch :<input type="text" name="branch" value="<%=resultSet.getString("branch") %>">
<br>
seat: <br>
<input type="text" name="seat" value="<%=resultSet.getString("seat") %>">
<br>
<input type="submit" value="submit">
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>
