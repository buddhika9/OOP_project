<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@page import="java.util.ArrayList"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

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
 


<!-- ListDetails -->
                    
                    
                        <div class="modal-body" style ="text-align:center;">
                        
                            <table class="table table-border" >
                    
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
                     ResultSet rs = null;
                   
                    

				try{ 
					
		 String id = request.getParameter("emp_id");
		con = DriverManager.getConnection(Url, username, pass);
		stmt=con.createStatement();
		String sql ="SELECT * FROM employee.employee where emp_id = '"+session.getAttribute("id")+"'";
		
		rs = stmt.executeQuery(sql);
		while(rs.next()){
			
			%> 
			
        <tr>
			<td>Employee ID</td>
			<td><input type="text" name="emp_id" value='<%=rs.getString("emp_id") %>' style = "border: none;" readonly></td>
		</tr>
		<tr>
			<td>Password</td>
			<td><input type="text" name="password" value='<%=rs.getString("password") %>' style = "border: none;" readonly></td>
		</tr>
		
		<tr>
			<td>first Name</td>
			<td><input type="text" name="fname" value='<%=rs.getString("fname") %>'style = "border: none;" readonly></td>
		</tr>
		<tr>
			<td>last Name</td>
			<td><input type="text" name="lname" value='<%=rs.getString("lname") %>' style = "border: none;" readonly></td>
		</tr>
		<tr>
			<td>Email</td>
			<td><input type="email" name="email" value='<%=rs.getString("email") %>' style = "border: none;" readonly></td>
		</tr>
		<tr>
			<td>Contact_Number</td>
			<td><input type="text" name="contact_num" value='<%=rs.getString("contact_num") %>' style = "border: none;" readonly></td>
		</tr>
		<tr>
			<td>Gender</td>
			<td>
				<input type="text" name="contact_num" value='<%=rs.getString("gender") %>' style = "border: none;" readonly>
			
			</td>
		</tr>
		<tr>
			<td>NIC</td>
			<td><input type="text" name="nic" value='<%=rs.getString("nic") %>' style = "border: none;" readonly></td>
		</tr>
		<tr>
			<td>Address</td>
			<td><textarea rows="3" cols="25" name="Address" style = "border: none;" readonly><%=rs.getString("address") %></textarea></td>
		</tr>
		<tr>
			<td>Post</td>
			<td><input type="text" name="post" value='<%=rs.getString("post") %>' style = "border: none;" readonly></td>
		</tr>
		
		
		
		<tr>
			<td>Department</td>
			<td>
				<input type="text" name="post" value='<%=rs.getString("department") %>' style = "border: none;" readonly>
				
			</td>
			
		</tr>
		
		<tr>
 
 				<td style ="align-content: center;"><a href ='updateEmployee.jsp?id=<%=rs.getString("emp_id") %>'>
					<input type ="submit" class="btn btn-warning" value = "Update" style="">
					</a>
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

    