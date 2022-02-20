package com.UGAHacks.InvestBetter.Servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "UserLoginControllerServlet", urlPatterns = {"/userLoginControllerServlet"})
public class UserLoginControllerServlet extends HttpServlet{
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sessionId = null;
		String emailID = request.getParameter("email");
		String password = request.getParameter("password");
				
		HttpSession session = request.getSession();
		session.setAttribute("emailID", emailID);
		session.setAttribute("password", password);
		
		if (null!= request.getCookies()) {
			for (Cookie cookie: request.getCookies()) {
				if ("JSESSIONID".equals(cookie.getName())) {
					sessionId = cookie.getValue();
				}
			}
		}
		System.out.println("Incoming request data log: session: " + sessionId + " at " + new Date() + " for " + request.getRequestURI());

//		RequestDispatcher user = request.getRequestDispatcher("/userAccount");
//        user.forward(request, response);
		response.sendRedirect("/userAccount");
	}
}
