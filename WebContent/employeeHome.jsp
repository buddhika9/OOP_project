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
 



<div class="row">
  <div class="side">
  
  <div style = "width: 1000px;">
  <video autoplay muted loop id="myVideo" style= "width: 1000px; height: auto;">
  <source src="vedio/IMG_8870.mp4" type="video/mp4">
</video>
 </div>
 
   <% try{ 
         		
         		con = DriverManager.getConnection(Url, username, pass);
         		stmt=con.createStatement();
         		String sql ="SELECT a.Message FROM employee.announcement a inner join employee.employee on a.empid = '"+session.getAttribute("id")+"'"
         		+"where a.empid = '"+session.getAttribute("id")+"'";
         		
         		rs = stmt.executeQuery(sql);
         		if(rs.next()){ %>
   <div class="info">
  <p>
  		 <h1 style = "margin-left: 10px; font-family: cursive; color: blue;">Latest Announcements</h1><br>
            <h4 style = "font-family: cursive; font-style: italic; color: black; margin-left:10px;"><%=rs.getString("Message")%></h4>
	</div>
  </div>  
</div>
  
   <%
         		}
         	}catch(Exception e){
         		e.printStackTrace();
         		
         	}	
%> 
 
<div>
    
  <div class="main" style = "background-color: white">
  <div style = "text-align: center;">
    <h2>OUR VISION</h2>
   </div >
    <p>As a B2B marketing agency focused on accelerating growth, we have road-tested these tips to help our clients thrive. No matter what industry your company is in, 
    crafting clear language that describes your purpose is a transformative exercise.
     It will make a difference for your business  and we have seen the same techniques work 
     for individuals in their careers and personal lives as well..</p>
    <br>
    
  </div>
</div>

<div style="width: 1000px; height: 100px; background-color: white; text-align: center; padding 10px;"><br>
	<h2>Our Team</h2>

 <div class="row">
  <div class="column">
    <div class="card">
      <img src="img/emp1.PNG" alt="Jane" style="width:100%; height:171px;">
      <div class="container" style = "height:200px;">
        <h2>Jane Doe</h2>
        <p class="title">CEO &amp; Founder</p>
        <p>He is the most vulnerable person in our company. Most delightful and Eligant Charactor.</p>
        <p>Jane.doe@gmail.com</p>
        
      </div>
    </div>
  </div>

  <div class="column">
    <div class="card">
      <img src="img/emp2.PNG" alt="Mike" style="width:100%;  height:171px;">
      <div class="container" style = "height:200px;">
        <h2>Mike Ross</h2>
        <p class="title">Manager</p>
        <p>She is the one of the most hard working women in our company.</p>
        <p>Mike.R@gmail.com</p>
      </div>
    </div>
  </div>

  <div class="column">
    <div class="card">
      <img src="img/emp3.PNG" alt="John" style="width:100%;  height:171px;">
      <div class="container" style= "height:200px;">
        <h2>Harly Queen</h2>
        <p class="title">Assistant Manager</p>
        <p>Do your wark hard far as you can to achive your targets</p>
        <p>Jon.d@example.com</p>
        </div></div>
      </div>
    </div>


<div style="width: 1000px; height: 100px; background-color: white; text-align: center;">
	<h2>Our Head Departments</h2>
</div>
 <div class="row">
  <div class="column">
    <div class="card">
      <img src="img/dep1.JPG" alt="Jane" style="width:100%; height:171px;">
      <div class="container" style = "height:200px;">
        <h2>Department of Employee</h2>        
        <p> 011112225</p>
        <p>Dep.employee@gamil.com</p>  
      </div>
    </div>
  </div>

  <div class="column">
    <div class="card">
      <img src="img/dep2.JPG" alt="Mike" style="width:100%; height:171px;">
      <div class="container" style = "height:200px;">
        <h2>Department of Finance</h2>        
        <p>022225452</p>
        <p>Dep.finace@gmail.com</p>
      
      </div>
    </div>
  </div>

  <div class="column">
    <div class="card">
      <img src="img/dep3.JPG" alt="John" style="width:100% ;height:171px;">
      <div class="container" style = "height:200px;">
        <h2>Department of Expences</h2>
        <p>222555668</p>
        <p>Dep.Expenses@gmail.com</p>
        
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

