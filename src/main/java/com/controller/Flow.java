package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.model.Enquiry;
import com.model.UserEnquiry;

@WebServlet(name = "register", urlPatterns = {"/register"})
public class Flow extends HttpServlet {
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=ISO-8859-1");
		HttpSession session = request.getSession();
		Enquiry enq = new Enquiry(session);
		
		try {
			 if (request.getParameter("signup") != null) {
	                String name = request.getParameter("uname");
	                String email = request.getParameter("uemail");
	                String password = request.getParameter("upassword");
	                String confirm = request.getParameter("cupassword");
	                if (password.equals(confirm)) {
	                    String status = enq.signup(name, email, password);
	                    if (status.equals("existed")) {
	                        request.setAttribute("status", "Already Registered");
	                        RequestDispatcher rd1 = request.getRequestDispatcher("signup.jsp");
	                        rd1.forward(request, response);
	                    } else if (status.equals("success")) {
	                        session.setAttribute("uname", name);
	                        session.setAttribute("email", email);
	                        session.setAttribute("id", enq.getUserId(email)); // Get user ID after signup
	                        RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
	                        rd1.forward(request, response);
	                    } else if (status.equals("failed")) {
	                        request.setAttribute("status", "Failed to Register");
	                        RequestDispatcher rd1 = request.getRequestDispatcher("signup.jsp");
	                        rd1.forward(request, response);
	                    }
	                }

	            }else if (request.getParameter("login") != null) {
	                String lemail = request.getParameter("umail");
	                String lpassword = request.getParameter("upass");

	                if (lemail.equals("kanasuevents@gmail.com") && lpassword.equals("1234567890")) {
	                    session.setAttribute("uname", "Admin");
	                    session.setAttribute("email", lemail);
	                    session.setAttribute("id", "admin");
	                    RequestDispatcher rd = request.getRequestDispatcher("adminpage.jsp");
	                    rd.forward(request, response);
	                } else {
	                    String status = enq.login(lemail, lpassword, session);
	                    if (status.equals("success")) {
	                        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
	                        rd.forward(request, response);
	                    } else if (status.equals("failure")) {
	                        request.setAttribute("status", "Wrong email or password");
	                        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
	                        rd.forward(request, response);
	                    }
	                }
	            }
			// Handle Event Status Update 
	            else if (request.getParameter("status") != null && request.getParameter("event_id") != null) { 
	            int eventId = Integer.parseInt(request.getParameter("event_id")); 
	            String status = request.getParameter("status"); 
	            boolean updateSuccess = enq.updateEventStatus(eventId, status); 
	            if (updateSuccess) { 
	            request.setAttribute("status", "Update successful"); 
	            } 
	            else { 
	            request.setAttribute("status", "Update failed"); 
	            } 
	            RequestDispatcher rd = request.getRequestDispatcher("bookedevents.jsp"); 
	            rd.forward(request, response); 
	            } 
	            
	            else if (request.getParameter("logout") != null) { 
	            	session.invalidate(); // Invalidate session 
	            	RequestDispatcher rd = request.getRequestDispatcher("index.jsp"); 
	            	rd.forward(request, response);
	            	}
			 
	     
			 
	            else if (request.getParameter("cancelEvent") != null) {
	                int eventId = Integer.parseInt(request.getParameter("eventId"));
	                boolean updateSuccess = enq.updateEventStatus(eventId, "cancelled");

	                if (updateSuccess) {
	                    request.setAttribute("status", "Event cancelled successfully.");
	                } else {
	                    request.setAttribute("status", "Failed to cancel event. Please try again.");
	                }

	                RequestDispatcher rd = request.getRequestDispatcher("userBooked.jsp");
	                rd.forward(request, response);
	            }
			 
	            else if (request.getParameter("enquiry") != null) {
	                String name = request.getParameter("name");
	                String email = request.getParameter("mail");
	                String tel = request.getParameter("tel");
	                String subject = request.getParameter("sub");
	                String message = request.getParameter("msg");

	                String status = enq.submitEnquiry(name, email, tel, subject, message);
	                if ("success".equals(status)) {
	                    request.setAttribute("message", "Enquiry submitted successfully.");
	                } else {
	                    request.setAttribute("message", "Failed to submit enquiry. Please try again.");
	                }
	                RequestDispatcher rd = request.getRequestDispatcher("contact.jsp");
	                rd.forward(request, response);
	            }
			 if (request.getParameter("resetPassword") != null) {
	                String email = request.getParameter("email");
	                String oldPassword = request.getParameter("oldPassword");
	                String newPassword = request.getParameter("newPassword");
	                String confirmNewPassword = request.getParameter("confirmNewPassword");

	                if (newPassword.equals(confirmNewPassword)) {
	                    String status = enq.resetPassword(email, oldPassword, newPassword);
	                    if (status.equals("success")) {
	                        request.setAttribute("status", "Password changed successfully.");
	                        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
	                        rd.forward(request, response);
	                    } else if (status.equals("failure")) {
	                        request.setAttribute("status", "Failed to change password. Please try again.");
	                        RequestDispatcher rd = request.getRequestDispatcher("resetPass.jsp");
	                        rd.forward(request, response);
	                    } else if (status.equals("incorrectOldPassword")) {
	                        request.setAttribute("status", "Old password is incorrect.");
	                        RequestDispatcher rd = request.getRequestDispatcher("resetPass.jsp");
	                        rd.forward(request, response);
	                    }
	                } else {
	                    request.setAttribute("status", "New password and confirm password do not match.");
	                    RequestDispatcher rd = request.getRequestDispatcher("resetPass.jsp");
	                    rd.forward(request, response);
	                }
			 }

	           
	            

		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	

	public String getServletInfo() {
		return "Short description";
	}
}





