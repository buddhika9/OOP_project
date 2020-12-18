<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%

String driverName = "com.mysql.jdbc.Driver";
String Url = "jdbc:mysql://localhost:3306/employee";
String username = "root";
String pass = "";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection con = null;
Statement stmt = null;
ResultSet rs,rs1 = null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Page Title</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href= "css/style.css">
     <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>

<div class="header">
  <h4>Welcome To The <b> AIET group of companies</b></h4>
 </b></p>
</div>

<div class="navbar">
  <a href="employeeHome.jsp" class="active">Home</a>
  <a href="employeeUserProfile.jsp"> User profile</a>                  
  <a href="indexempsalary.jsp"> Salary</a>
  <a href="indexempaddleave.jsp"> Leaves</a>
  
     
                <%if(session.getAttribute("id") != null){%>
                  
         		   <a class="right" data-toggle="modal" data-target="#exampleModalCenter1" style= "color: white;">Logout</a>
         		   <%}           
           			 else {%>
           			 <a class="right" href ="login.jsp"><li><i class="fa fa-sign-out"></i> login</li></a> 
           			 <%}%>
             
            </div>
 



<div class="container">
					<br><br>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter" style="margin-bottom: 15px;;">
                        Add Leave
                    </button>
                    <h3>Recent Leaves</h3>

<!-- ListDetails -->

                    <table class="table table-bordered">
                        <tr>
				<td><b>Reason</b></td>
				<td><b>From</b></td>
				<td><b>TO</b></td>
		
				<td><b>Status</b></td>
				<td><b>Action</b></td>
				
            </tr>
        
		
		<%
	try{ 
		;
			
		con = DriverManager.getConnection(Url, username, pass);
		stmt=con.createStatement();
		String sql ="SELECT * FROM employee.leaves where EmpId = '"+session.getAttribute("id")+"'";
	// String sql1 = "Select emp_id from employee.employee where emp_id = '"++"'";
		
		rs = stmt.executeQuery(sql);
	
     
		while(rs.next()){
			
			%>
    
			
			 <tr>
				
				<td><%=rs.getString("Reason") %></td>
				<td><%=rs.getString("FromDate") %></td>
				<td><%=rs.getString("ToDate") %></td>
				<td><%=rs.getString("status") %></td>
				
				
				
				<td>
					
				<a href ='UpdateLeave.jsp?id=<%=rs.getString("EmpId") %>'>
					<input type ="submit" class=  "btn btn-warning" value = "edit"></a>
				<a href ='deleteLeave.jsp?id=<%=rs.getString("EmpId") %>'>
				    <input type ="submit" class= "btn btn-danger" value = "Delete"></a></td>
				
				
	<% 
		}
			} catch (Exception e) {
				e.printStackTrace();
		}
	%>    
                    </table>
                </div>
            </div>

            <!-- PopUp -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLongTitle">Add Leave</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    
                    <!-- Add/edit/delete forms--> 
                    
                    <form action="AddLeave" method="POST">
                        <div class="modal-body">
                            <table class="table table-borderless">
                               <tr>
			<td>Employee ID</td>
			<td><input type="text" name="id"  Value = '<%=session.getAttribute("id") %>' readonly></td>
		</tr>
		<tr>
			<td>Reason</td>
			<td><textarea rows="6" cols="25" name="Reason" placeholder="Reason"></textarea></td>
		</tr>
		
		<tr>
			<td>From</td>
			<td><input type="date" name="FromDate" placeholder="yyyy-mm-dd" ></td>
		</tr>
		
		<tr>
			<td>To</td>
			<td><input type="date" name="ToDate" ></td>
		</tr>
		
		<tr>
			<td>status</td>
			<td>
				<select name = "status">
					<option name="Request">Request</option>
				
				</select>
			
		</tr>
		
		
			
                            </table>   
                        </div>
                        <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <input type="submit" class="btn btn-success" value="Add Details">
                        </div>
                    </form>
                    
                  </div>
                </div>
              </div>
            </div>
        
        
        
          <!-- PopUp logout -->
            <div class="modal fade" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLongTitle">Logout</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    
                    
                    <!-- Add/update/delete employee forms -->
                    
                    <form action="logout" method="POST">
                    
                        <div class="modal-body">
                            <table class="table table-borderless">
         <tr>
			<td><h1>Confirm your logout</h1></td>
			</tr>
		
			
                            </table>   
                        </div>
                        <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <input type="submit" class="btn btn-primary" value="Confrim">
                        </div>
                    </form>
                  </div>
                </div>
              </div>
</body>


</html>
    