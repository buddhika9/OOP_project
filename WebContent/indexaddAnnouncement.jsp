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
                    <h2>Announcement Details</h2>
                </div>

                <div class="container">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter" style="margin-bottom: 15px;;">
                        Add Announcement
                         </button>
                        <div style = "float: right;">
						<form action = "#" method ="post">
							<input type="text" name = "search" placeholder = "Search here.."/>
						</form>
                   
				</div>
                   
				</div>
<!-- ListDetails -->
                    <table class="table table-bordered">
                         <tr>
                <td><b>Announcement ID</b></td>
				<td><b>Message</b></td>
				<td><b>Employee ID</b></td>
				<td><b>Edit</b></td>
				<td><b>Delete</b></td>
            </tr>
                        <%
	try{ 
		
		con = DriverManager.getConnection(Url, username, pass);
		stmt=con.createStatement();
		String search =request.getParameter("search");
		String sql;
		
		if(search != null){
			sql ="SELECT * FROM employee.announcement where empid like '%"+search+"%'";
			
		}else{
			
			sql ="SELECT * FROM employee.announcement";
		}
		rs = stmt.executeQuery(sql);
		while(rs.next()){
			
			%>
			
			 <tr>
				<td><%=rs.getString("id") %></td>
				<td><%=rs.getString("message") %></td>
				<td><%=rs.getString("empid") %></td>
				
				
				<td><a href ='updateAnnouncement.jsp?id=<%=rs.getString("id") %>'>
					<input type ="submit" class = "btn btn-warning" value = "edit"></a></td>
				<td><a href ='deleteAnnouncement.jsp?empid=<%=rs.getString("empid") %>'>
				    <input type ="submit" class = "btn btn-danger" value = "Delete"></a></td>
				
				
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
                      <h5 class="modal-title" id="exampleModalLongTitle">Form title</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    
                    <!-- Add/edit/delete forms--> 
                    
                    <form action="Addannouncemnt" method="POST">
                        <div class="modal-body">
                            <table class="table table-borderless">
                                
			
		<tr>
			<td>Message</td>
			<td><input type="text" name="message" placeholder="message"></td>
		</tr>
		
		<tr>
			<td>Employee ID</td>
			<td><input type="text" name="cusid" placeholder="cusid"></td>
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
