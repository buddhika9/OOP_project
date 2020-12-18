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

<div class="table1">	

  
         
                <div class="modal-dialog modal-dialog-centered" role="document">
                  <div class="modal-content">
                    <div class="modal-header" style= "background-color: Gold;">
                      <h5 class="modal-title" id="exampleModalLongTitle">Update Leave</h5>
                     
                
                    </div>
<table align="center" cellpadding="10">
		<div class="edit">
		
			<form action="UpdateLeave" method="Post"> 
			
			 <%
		stmt=con.createStatement();
		
		String id = request.getParameter("id");
		String sql ="SELECT * FROM employee.leaves where EmpId = '"+id+"'";
		
		rs = stmt.executeQuery(sql);
		while(rs.next()){
			
			%>
			<input type="hidden" name="id" value ='<%=session.getAttribute("id") %>'>
			<tr>
			<td>Employee ID</td>
			<td><input type="text" name="id" value ='<%=rs.getString("EmpId")%>'></td>
		</tr>
		<tr>
			<td>Reason</td>
			<td><textarea rows="6" cols="25" name="Reason" ><%=rs.getString("Reason")%></textarea></td>
		</tr>
		
		<tr>
			<td>From</td>
			<td><input type="date" name="FromDate" value ='<%=rs.getString("FromDate")%>' ></td>
		</tr>
		
		<tr>
			<td>To</td>
			<td><input type="date" name="ToDate" value ='<%=rs.getString("ToDate")%>'></td>
		</tr>
		
		<tr>
			<td>status</td>
			<td>
				<select name = "status" value ='<%=rs.getString("Status")%>'>
					<option >Request</option>		
				</select>
			
		
		
			<tr>
			<td align="center" colspan="2"><input type="submit"  class= "btn btn-success" value = "Update">
			</td>
		</tr>
		
		<%
		}
		%>
		
		
	
		</table>
		</form>
	</div>
	</div>
	</div>
	





</body>
</html>