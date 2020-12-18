package com.salaryServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Employee.EmployeeDBUtil;
import com.salary.SalaryDBUtil;

/**
 * Servlet implementation class DeleteSalaryServlet
 */
@WebServlet("/DeleteSalaryServlet")
public class DeleteSalaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean isTrue = false;
		
		 //recieving the employee id send from the employee list
		 int emp_id =Integer.parseInt(request.getParameter("empid")) ;
		 
		
		try {
		//creating an object of SalaryDBUtil class
			SalaryDBUtil salaryDBUtil = new SalaryDBUtil();
		//sending the recieved id to the EmployeeDB to delete the user
			isTrue =  salaryDBUtil.deleteSalary(emp_id);
			
			if(isTrue == true) {
		//redirecting to the salary list form
				response.sendRedirect("indexaddsalary.jsp");
			}else {
				
		//redirecting to the salary list form
				response.sendRedirect("adminHome.jsp");	
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
			
			
	
	}
	}


