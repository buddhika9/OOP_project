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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="header">
  <h4>Welcome To The <b> AIET group of companies</b></h4>
 </b></p>
</div>

<div class="navbar">
  				 <a href="adminHome.jsp" class="activebar"> Dashboard</a>
                  <a href="indexaddAnnouncement.jsp" >Add Announcement</a>
                  <a href="indexaddEmployee.jsp">Add Employee</a>
                  <a href="indexaddDepartment.jsp">Add Department</a>
                  <a href="indexaddsalary.jsp">Add Salary</a>
                  <a href="indexadminleave.jsp">Add Leaves</a>
    
     
                <%if(session.getAttribute("id") != null){%>
                  
         		   <a class="right" data-toggle="modal" data-target="#exampleModalCenter1" style= "color: white;">Logout</a>
         		   <%}           
           			 else {%>
           			 <a class="right" href ="login.jsp"><li><i class="fa fa-sign-out"></i> login</li></a> 
           			 <%}%>
             
            </div>
 
 
                    

<!-- ListEmployee -->
                  
        <br><br>
           <!-- Add New Employee -->
                <div class="container">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter" style="margin-bottom: 15px;;">
                        Add New Employee
                    </button>
                    
                    <div style = "float: right;">
						<form action = "#" method ="post">
							<input type="text" name = "search" placeholder = "Search here.."/>
						</form>
                   
				</div>
				</div>
		<!-- ListEmployee -->
                    <table class="table table-bordered">
                    
                     <tr>
                     <td><b>Employee ID</b></td>
     				<td><b>First Name</b></td>     				
     				<td><b>Gender</b></td>     		
     				<td><b>Contact No</b></td>
     				<td><b>NIC</b></td>
     				<td><b>Post</b></td>     				
     				<td><b>department</b></td>
     				<td><b>Action</b></td>
     				
                 </tr>
                     <%
            	try{ 
            		
		 String id = request.getParameter("emp_id");
		con = DriverManager.getConnection(Url, username, pass);
		stmt=con.createStatement();
		String search =request.getParameter("search");
		String sql;
				
		if(search != null){
			
			sql ="SELECT * FROM employee.employee where emp_id like '%"+search+"%' or fname like '%"+search+"%'  or nic like '%"+search+"%'";
		}else{
			
			sql ="SELECT * FROM employee.employee";
		}
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
		
		
			
			%> 
            
                       <tr>
				<td><%=rs.getString("emp_id") %></td>
				<td><%=rs.getString("fname") %></td>			
				<td><%=rs.getString("gender") %></td>				
				<td><%=rs.getString("contact_num") %></td>
				<td><%=rs.getString("nic") %></td>
				<td><%=rs.getString("post") %></td>
				<td><%=rs.getString("department") %></td>
			
				
				
				<td><a href ='updateEmployee.jsp?id=<%=rs.getString("emp_id") %>'>
					<input type ="submit" class="btn btn-warning" value = "Update">
					</a>				
				<a href ='deleteemployee.jsp?id=<%=rs.getString("emp_id") %>'><input type ="submit" class="btn btn-danger"value = "Delete"></a></td>
				</tr>
				
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
                      <h5 class="modal-title" id="exampleModalLongTitle">Registration</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    
                    <!-- Add employee forms -->
                    
                    <form action="Add" method="POST">
                        <div class="modal-body">
                            <table class="table table-borderless">
                                <tr>
			<td>Employee ID</td>
			<td><input type="text" name="emp_id" placeholder="EmpID"></td>
		</tr>
		<tr>
			<td>Password</td>
			<td><input type="password" name="password" placeholder="Password"></td>
		</tr>
		
		<tr>
			<td>first Name</td>
			<td><input type="text" name="fname" placeholder="Fname"></td>
		</tr>
		<tr>
			<td>last Name</td>
			<td><input type="text" name="lname" placeholder="Lname"></td>
		</tr>
		<tr>
			<td>Email</td>
			<td><input type="email" name="email" placeholder="abc@gmail.com"></td>
		</tr>
		<tr>
			<td>Contact_Number</td>
			<td><input type="text" name="contact_num" placeholder="ContactNumber"></td>
		</tr>
		<tr>
			<td>Gender</td>
			<td>
				<select name="gender">
					<option>Male</option>
					<option>Female</option>
				</select>
			
			</td>
		</tr>
		<tr>
			<td>NIC</td>
			<td><input type="text" name="nic" placeholder="NIC"></td>
		</tr>
		<tr>
			<td>Address</td>
			<td><textarea rows="3" cols="25" placeholder="Address" name ="address"></textarea></td>
		</tr>
		<tr>
			<td>Post</td>
			<td><input type="text" name="post" placeholder="Post"></td>
		</tr>
		
		
		
		<tr>
			<td>Department</td>
			<td>
				<select name="department">
				<%try{ 
			 
					//getting depaetment names from department
				String sql2 ="SELECT deptName FROM employee.department";
				
				rs = stmt.executeQuery(sql2);
				while(rs.next()){ %>
				
					<option><%=rs.getString("deptName")%></option>
					<%}}finally{} %>  
				</select>
				
			</td>
			
		</tr>
               
               
                          </table>   
                        </div>
                        <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <input type="submit" class="btn btn-primary" value="Add Details">
                        </div>
                    </form>
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
			<td><h1>Confirm your logout..</h1></td>
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
    