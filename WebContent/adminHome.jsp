<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
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
ResultSet rs,rs1 = null;

Class.forName(driverName).newInstance();

con = DriverManager.getConnection(Url, username, pass);

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
  				  <a href="adminHome.jsp" class="activebar">Dashboard</a>
                  <a href="indexaddAnnouncement.jsp" >Add Announcement</a>
                  <a href="indexaddEmployee.jsp">Add Employee</a>
                  <a href="indexaddDepartment.jsp">Add Department</a>
                  <a href="indexaddsalary.jsp">Add Salary</a>
                  <a href="indexadminleave.jsp">Approve Leaves</a>
  
     
                <%if(session.getAttribute("id") != null){%>
                  
         		   <a class="right" data-toggle="modal" data-target="#exampleModalCenter1" style= "color: white;">Logout</a>
         		   <%}           
           			 else {%>
           			 <a class="right" href ="login.jsp"> login</a> 
           			 <%}%>
             
            </div>
            
            <%
          
    		try{
    			
    			stmt=con.createStatement();
    			String sql = "SELECT count(emp_id) from employee.employee";  
    			
    			
    			rs = stmt.executeQuery(sql);
    		
    				if(rs.next()){
    					int sum = rs.getInt("count(emp_id)");
    					
    				
            %>
       
            	     <div class="row">
  						<div class="column1">
    					<div class="card">
    					  <p><i class="fa fa-user"></i></p>
     					 <h3><%=sum %></h3>
     					 <p>Total Employees</p>
    					</div>
  						</div>
  
   
           <%
    			}
    					}catch(Exception e){
    				e.printStackTrace();
    			}
           
           
           %>


			<%
			try{
    			
    			stmt=con.createStatement();
    			String sql = "SELECT count(deptID) from employee.department";  
    			rs = stmt.executeQuery(sql);
    				if(rs.next()){
    					int count = rs.getInt("count(deptID)");
    				
            %>

  						<div class="column1">
   							<div class="card">
      						<p><i class="fa fa-building"></i></p>
      						<h3><%=count %></h3>
      						<p>Total Departments</p>
    						</div>
  						</div>
  
 		   <%
    			}
    					}catch(Exception e){
    				e.printStackTrace();
    			}
       
           %>
  
  
  		<%
			try{
    			
    			stmt=con.createStatement();
    			String sql = "SELECT count(id) from employee.leaves";  
    			rs = stmt.executeQuery(sql);
    				if(rs.next()){
    					int count = rs.getInt("count(id)");
    				
            %>
  
 					 <div class="column1">
    					<div class="card">
      					<p><i class="fa fa-sign-out"></i></p>
      					<h3><%=count %></h3>
      					<p>Leave Requests</p>
    					</div>
  					</div>
 		<%
    			}
    					}catch(Exception e){
    				e.printStackTrace();
    			}
       
           %>
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
