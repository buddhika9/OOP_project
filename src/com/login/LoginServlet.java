package com.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Employee.Employee;
import com.Employee.EmployeeDBUtil;
import com.EmployeeService.EmployeeService;
import com.Leave.Leave;
import com.Leave.LeaveDBUtil;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//Get User id and Password from the Form
				String id = request.getParameter("id");
				String password = request.getParameter("password");
				
				//Create the Session
				HttpSession session = request.getSession();
								
				//Create an Object LoginDBUtil Class
				LoginDBUtil loginCheck = new LoginDBUtil();
					
				boolean isTrue;
				
			
				//Check the Email and Password
				if(loginCheck.checkEmployee(id, password))
				{			
					
									
					//Assign Values to the session
					session.setAttribute("id", id);
					session.setAttribute("password", password);
					
					EmployeeService EmployeeService = new EmployeeDBUtil();
					
					List<Employee> EmpDetails = EmployeeService.validate(id, password);
					
		        	request.setAttribute("EmpDetails",EmpDetails);
		        	
					//Login Success Message
					System.out.println("Login Success");
					
					//Redirect to the Customer Profile Page
					response.sendRedirect("employeeHome.jsp");
									
				}
	
				else if(loginCheck.checkAdmin(id, password))
				{
					//Login Success Message
					System.out.println("Admin Login Success");
					
					//Redirect to the admin Profile Page
					response.sendRedirect("adminHome.jsp");
					
					session.setAttribute("user", "Admin");
					session.setAttribute("id", id);
					session.setAttribute("password", password);
				}
								
				else {
					//Login Failed Message
					System.out.println("Login Failed");
					
					//Redirect to the Customer Profile Page
					response.sendRedirect("login.jsp?Login=Failed");
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp?login=Failed");
					PrintWriter out = response.getWriter();
					out.println("<font color = red>Login Failed</font>");
					rd.include(request, response);
					
				}
			}
	}








