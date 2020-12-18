package com.salaryServlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.department.DepartmentDBUtil;
import com.salary.SalaryDBUtil;

/**
 * Servlet implementation class AddSalaryServlet
 */
@WebServlet("/AddSalaryServlet")
public class AddSalaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//setting the recieved values from the adepartment forms to variables
				String month = request.getParameter("month");
				double pavement = Double.parseDouble(request.getParameter("pavement")) ;
				double comission = Double.parseDouble(request.getParameter("comission"));
				String empid = request.getParameter("empid");
				
				
				
			boolean isTrue;
			//sending the set values to the insert method in DepartmentDBUtil 
				isTrue = SalaryDBUtil.insertsalary( month, pavement, comission, empid);
				
				if(isTrue == true) {
					//redirecting to the list department form
					RequestDispatcher dis = request.getRequestDispatcher("indexaddsalary.jsp");
					dis.forward(request, response);
					
				} else {
					//redirecting to the list department form
					RequestDispatcher dis2 = request.getRequestDispatcher("indexaddsalary.jsp");
					dis2.forward(request, response);
				}
				
				
			}
	
	}


