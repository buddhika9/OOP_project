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
            <div class="col-md-10">
                <div class="title-bar">
                   <h2>Department Details</h2>
                </div>

                <div class="container">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter" style="margin-bottom: 15px;;">
                        Add New Department
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
                <td><b>Department ID</b></td>
				<td><b>Department Name</b></td>
				<td><b>Department Location</b></td>
				<td><b>Head</b></td>
				<td><b>Edit</b></td>
				<td><b>Delete</b></td>
				
            </tr>
                     <%
                 
                     try{ 
                 		
                 		con = DriverManager.getConnection(Url, username, pass);
                 		stmt=con.createStatement();
                 		String search =request.getParameter("search");
                 		String sql ;
                 		
                 		if(search != null){
                 			sql ="SELECT * FROM employee.department where deptName like '%"+search+"%' or deptID like '"+search+"'";
                 			
                 		}else {
                 			sql ="SELECT * FROM employee.department";
                 			
                 		}
                 		
                 		rs = stmt.executeQuery(sql);
                 		while(rs.next()){
			
			%> 
            
                <tr>
				<td><%=rs.getString("DeptID") %></td>
				<td><%=rs.getString("DeptName") %></td>
				<td><%=rs.getString("DeptLocation") %></td>
				<td><%=rs.getString("DeptHead") %></td>
				
				
				
				<td>
				
				<a href ='UpdateDepartment.jsp?id=<%=rs.getString("DeptID") %>'>
				<input type ="submit"  class = "btn btn-warning"value = "Update"></a></td>
				
					 
					
					
				<td><a href ='deleteDepartment.jsp?id=<%=rs.getString("DeptID") %>'>
				<input type ="submit"  class = "btn btn-danger"value = "Delete"></a></td>
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
                    
                    
                    <!-- Add/update/delete employee forms -->
                    
                    <form action="AddDepartment" method="POST">
                    
                        <div class="modal-body">
                            <table class="table table-borderless">
         <tr>
			<td>Department ID</td>
			<td><input type="text" name="DeptId" placeholder="DeptId"></td>
		</tr>
		<tr>
			<td>Department name</td>
			<td><input type="text" name="DeptName" placeholder="DeptName"></td>
		</tr>
		
		<tr>
			<td>Department Location</td>
			<td><input type="text" name="DeptLocation" placeholder="DeptLocation"></td>
		</tr>
		<tr>
			<td>Department Head</td>
			<td><input type="text" name="DeptHead" placeholder="DeptHead"></td>
		</tr>
		<tr>
			
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
    