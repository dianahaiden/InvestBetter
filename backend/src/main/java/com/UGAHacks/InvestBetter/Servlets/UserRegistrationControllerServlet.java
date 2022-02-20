package com.UGAHacks.InvestBetter.Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UserRegistrationControllerServlet", urlPatterns = {"/userRegistrationControllerServlet"})
public class UserRegistrationControllerServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstName = request.getParameter("fNameReg");
		String lastName = request.getParameter("lNameReg");
		String emailID = request.getParameter("emailReg");
		String password = request.getParameter("passwordReg");
		String confirmPassword = request.getParameter("cpasswordReg");

         RequestDispatcher user = request.getRequestDispatcher("/registerConfirmation");
         user.include(request, response);
	}
	
	 @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

}
