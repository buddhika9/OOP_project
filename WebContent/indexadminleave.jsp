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
		
		con = DriverManager.getConnection(Url, username, pass);
		stmt=con.createStatement();
		String search =request.getParameter("search");
		String sql ;
		
		if(search !=null){
			
			sql ="SELECT * FROM employee.leaves where EmpID like '%"+search+"%' or Status like '%"+search+"%'";
			
		}else{
			
			sql ="SELECT * FROM employee.leaves";
		}
		
		rs = stmt.executeQuery(sql);
		while(rs.next()){
			
			%>
			
			 <tr>
				
				<td><%=rs.getString("Reason") %></td>
				<td><%=rs.getString("FromDate") %></td>
				<td><%=rs.getString("ToDate") %></td>
				<td><%=rs.getString("status") %></td>
				
				
				
				<td>
					
				<a href ='indexadminLeaveUpdate.jsp?id=<%=rs.getString("EmpId") %>'>
					<input type ="submit" class=  "btn btn-warning" value = "Edit"></a>
				
				<a href ='admindeleteLeave.jsp?id=<%=rs.getString("EmpId") %>'>
					<input type ="submit" class=  "btn btn-danger" value = "Delete"></a></td>
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

