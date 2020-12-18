package com.EmployeeServlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Employee.Employee;
import com.Employee.EmployeeDBUtil;
import com.EmployeeService.EmployeeService;


/**
 * Servlet implementation class UpdateEmployeeServlet
 */
@WebServlet("/UpdateEmployeeServlet")
public class UpdateEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
			//recieving the values from the update form
		    String emp_id = request.getParameter("id");
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String post = request.getParameter("post");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			String contact_num = request.getParameter("contact_num");
			String address = request.getParameter("address");
			String gender = request.getParameter("gender");
			String nic = request.getParameter("nic");
			String department = request.getParameter("department");
			
		
			EmployeeService EmployeeService = new EmployeeDBUtil();
			boolean isTrue;
			
			
			//sending the recieved values to the EmployeeDB
			isTrue = EmployeeService.updateemp( emp_id, fname,  lname, gender, address, contact_num,nic,  post, email,password,department );
			
			if(isTrue == true) {
		    try {
		    //redirecting to the employee list form
	        	 response.sendRedirect("indexaddEmployee.jsp");
	      		  
		    }
		    catch (Exception e) {
			e.printStackTrace();
		    }
			}else {
		    
			//redirecting to the employee list form
		    RequestDispatcher dis = request.getRequestDispatcher("indexaddEmployee.jsp");
		    dis.forward(request, response);    
		    
			}
			
			}
		
		
	}


