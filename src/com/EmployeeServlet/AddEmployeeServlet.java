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
 * Servlet implementation class AddEmployeeServlet
 */
@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Setting the values to variable sent from the employee register form
		int emp_id = Integer.parseInt( request.getParameter("emp_id")) ;
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
		
		
		boolean isTrue;
		
		EmployeeService EmployeeService = new EmployeeDBUtil();
		//sending the set values to the EmployeeDB
		isTrue = EmployeeService.insertcustomer( emp_id, fname,  lname, gender, address, contact_num,nic,  post, email,password ,department);
		
		if(isTrue == true) {
			//redirecting to the List Employee form
			RequestDispatcher dis = request.getRequestDispatcher("indexaddEmployee.jsp");
			dis.forward(request, response);
		} else {
			//redirecting to the List Employee form
			RequestDispatcher dis2 = request.getRequestDispatcher("indexaddEmployee.jsp");
			dis2.forward(request, response);
		}
		
		
	}
		
}


