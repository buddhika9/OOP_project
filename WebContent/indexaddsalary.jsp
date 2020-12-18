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
                  <a href="indexadminleave.jsp">Approve Leaves</a>
  
     
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
                   <h2>Salary Details</h2>
                </div>

				
                <div class="container">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter" style="margin-bottom: 15px;;">
                        Add New Salary
                    </button>
                    <div style = "float: right;">
						<form action = "#" method ="post">
							<input type="text" name = "search" placeholder = "Search by month or id..."/>
						</form>
                   
				</div>
				</div>
<!-- ListEmployee -->
                    <table class="table table-bordered">
                    
                    <tr>
               <td><b>Employee ID</b></td>
				<td><b>Month</b></td>
				<td><b>Payment amount</b></td>
				<td><b>Comission</b></td>
				
				<td><b>Action</b></td>
				
            </tr>
                     <%
                     
                  try {
                	  
                     Class.forName(driverName);
                     } catch (ClassNotFoundException e) {
                     e.printStackTrace();
                     }

                     try{ 
                 		
                 		con = DriverManager.getConnection(Url, username, pass);
                 		stmt=con.createStatement();
                 		String search =request.getParameter("search");
                 		String sql ;
                 		
                 		if(search != null){
                 			
                 			sql ="SELECT * FROM employee.salary where months like '%"+search+"%' or empid like '%"+search+"%'";
                 			
                 		}else {
                 			
                 			sql ="SELECT * FROM employee.salary";
                 			
                 		}
                 		rs = stmt.executeQuery(sql);
                 		while(rs.next()){
			
			%> 
            
                <tr>
				<td><%=rs.getString("empid") %></td>
				<td><%=rs.getString("months") %></td>
				<td><%=rs.getString("pavement") %></td>
				<td><%=rs.getString("comission") %></td>
				
				
				<td>
				<a href ='updateSalary.jsp?id=<%=rs.getString("empid")%>'>
				<input type ="submit"  class = "btn btn-warning"value = "Update"></a>
			
				
				<a href ='deletesalary.jsp?id=<%=rs.getString("empid")%>'>
				<input type ="submit"  class = "btn btn-danger"value = "Delete"></a>
				</td>
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
                    
                    <form action="addsalary" method="POST">
                    
                        <div class="modal-body">
                            <table class="table table-borderless">
         <tr>
			<td>Employee ID</td>
			<td><input type="text" name="empid" placeholder="Employee ID"></td>
		</tr>
		<tr>
			<td>Month</td>
			<td>
			<select name = "month">
				<option>January</option>
				<option>February</option>
				<option>March</option>
				<option>April</option>
				<option>May</option>
				<option>June</option>
				<option>July</option>
				<option>August</option>
				<option>September</option>
				<option>October</option>
				<option>November</option>
				<option>December</option>
			
			</select>
			
		</tr>
		
		<tr>
			<td>Pavement</td>
			<td><input type="text" name="pavement" placeholder="pavement"></td>
		</tr>
		<tr>
			<td>comission</td>
			<td><input type="text" name="comission" placeholder="comission"></td>
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
            </div>
            

</body>


</html>
