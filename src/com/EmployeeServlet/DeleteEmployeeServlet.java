package com.EmployeeServlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Employee.EmployeeDBUtil;
import com.EmployeeService.EmployeeService;



/**
 * Servlet implementation class DeleteEmployeeServlet
 */
@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 boolean isTrue = false;
		 
		 //recieving the employee id send from the employee list
		 String emp_id = request.getParameter("id");
		 
		
		try {
		
			EmployeeService EmployeeService = new EmployeeDBUtil();
		//sending the recieved id to the EmployeeDB to delete the user
			isTrue =  EmployeeService.deleteemp(emp_id);
			
			if(isTrue == true) {
		//redirecting to the employee list form
				response.sendRedirect("indexaddEmployee.jsp");
			}else {
				
		//redirecting to the employee list form
				response.sendRedirect("indexaddEmployee.jsp");	
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
			
			
	
	}

}
