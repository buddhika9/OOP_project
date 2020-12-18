<%@page import="sun.font.CreatedFontTracker"%>
<%@page import="jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
        <link rel="stylesheet" href="css/style.css">   
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String driverName = "com.mysql.jdbc.Driver";
String username = "root";
String pass = "";

String Url = "jdbc:mysql://localhost:3306/employee";

Statement stmt = null;
Connection con = null;
ResultSet rs,rs1 = null;

Class.forName(driverName).newInstance();

con = DriverManager.getConnection(Url, username, pass);

%>

<div class="table1">	

  
         
                <div class="modal-dialog modal-dialog-centered" role="document">
                  <div class="modal-content">
                    <div class="modal-header" style = "background-color: gold">
                      <h5 class="modal-title" id="exampleModalLongTitle">Update Employee Details</h5>
                     
                
                    </div>
		<table align="center" cellpadding="10">
		<div class="edit">
		
			<form action="UpdateEmp" method="Post"> 
			
	<%
		stmt=con.createStatement();
			 
		//Getting values from the employee form
		String id = request.getParameter("id");
		
		//Getting details from the employee table
		String sql ="SELECT * FROM employee.employee where emp_id = '"+id+"'";
		
		rs = stmt.executeQuery(sql);
		while(rs.next()){
			
			%>
			<input type= "hidden" name = "id" value = '<%=rs.getString("emp_id") %>' />
		<tr>
			<td>Employee ID</td>
			<td><input type="text" name="id" value ='<%=rs.getString("emp_id")%>'></td>
		</tr>
		<tr>
			<td>Password</td>
			<td><input type="text" name="password" value ='<%=rs.getString("password")%>'></td>
		</tr>
		
		<tr>
			<td>first Name</td>
			<td><input type="text" name="fname" value ='<%=rs.getString("fname")%>'></td>
		</tr>
		<tr>
			<td>last Name</td>
			<td><input type="text" name="lname" value ='<%=rs.getString("lname")%>'></td>
		</tr>
		<tr>
			<td>Email</td>
			<td><input type="email" name="email" value ='<%=rs.getString("email")%>'></td>
		</tr>
		<tr>
			<td>Contact_Number</td>
			<td><input type="text" name="contact_num" value ='<%=rs.getString("contact_num")%>'></td>
		</tr>
		<tr>
			<td>Gender</td>
			<td><input type="text" name="gender" value ='<%=rs.getString("gender")%>'></td>
		</tr>
		<tr>
			<td>NIC</td>
			<td><input type="text" name="nic" value ='<%=rs.getString("nic")%>'></td>
		</tr>
		<tr>
			<td>Address</td>
			<td><textarea rows="3" cols="25"  name ="address" ><%=rs.getString("address")%></textarea></td>
		</tr>
		<tr>
			<td>Post</td>
			<td><input type="text" name="post" value ='<%=rs.getString("post")%>'></td>
		</tr>
		
		<tr>
			<td>Department</td>
				<td><input type="text" name="department" value ='<%=rs.getString("department")%>' readonly></td>
			</td>
		</tr>
		
		<tr>
			
			<td align="center" colspan="2"><input type="submit"  class= "btn btn-primary" value = "Update">
			</td>
		</tr>
		
		</form>
		
		<%
		
				}
		%>
		
		
		</table>
		</div>
		</div>
		
	</div>
</body>
</html>