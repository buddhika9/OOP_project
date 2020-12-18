<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>


<%
String driverName = "com.mysql.jdbc.Driver";
String username = "root";
String pass = "";

String Url = "jdbc:mysql://localhost:3306/employee";

Statement stmt = null;
Connection con = null;
ResultSet rs = null;

Class.forName(driverName).newInstance();

con = DriverManager.getConnection(Url, username, pass);

%>
<!DOCTYPE html>
<html>
<head>
 <title></title>
     <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
        <link rel="stylesheet" href="css/style.css">   

</head>
<body>


<div class="table1">	

  
         
                <div class="modal-dialog modal-dialog-centered" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLongTitle">Update</h5>
                     
                
                    </div>
		<table align="center" cellpadding="10">
		<div class="edit">
		
		<%
		stmt=con.createStatement();
		
		String id = request.getParameter("id");
		String sql ="SELECT * FROM employee.department where deptID = '"+id+"'";
		
		rs = stmt.executeQuery(sql);
		while(rs.next()){
			
			%>
			<form action="UpdateDepartment" method="Post"> 
			
			
		<tr>
			<td>Department ID</td>
			<td><input type="text" name="DeptId" value = '<%=rs.getString("deptID") %>'></td>
		</tr>
		<tr>
			<td>Department name</td>
			<td><input type="text" name="DeptName" value = '<%=rs.getString("deptName") %>'></td>
		</tr>
		
		<tr>
			<td>Department Location</td>
			<td><input type="text" name="DeptLocation" value = '<%=rs.getString("deptLocation") %>'></td>
		</tr>
		<tr>
			<td>Department Head</td>
			<td><input type="text" name="DeptHead" value = '<%=rs.getString("deptHead") %>'></td>
		</tr>
		<tr>
			
		
			
			
		
		</table>
		 <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <input type="submit" class="btn btn-primary" value="Update Details">
                        </div>
                </form>
                  </div>
                </div>
              </div>
				
			<%
		}
		%>
		
	

</div>
</body>
</html>