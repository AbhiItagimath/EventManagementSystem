package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.model.Enquiry;

@WebServlet(name = "addtocart", urlPatterns = { "/addtocart" })
public class AddToCart extends HttpServlet{
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html;charset=ISO-8859-1");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		Enquiry enq = new Enquiry(session);
		
		try {
			if (session.getAttribute("uname") != null && request.getParameter("bookevent") != null) { 
				String status = enq.Booknow(request); 
				if (status.equals("success")) { 
					request.setAttribute("status", "Booking successful"); 
					RequestDispatcher rd = request.getRequestDispatcher("booking.jsp?event_id=" + request.getParameter("event_id")); 
					rd.forward(request, response); 
				} else if (status.equals("failure")) { 
						request.setAttribute("status", "Booking failed"); 
						RequestDispatcher rd = request.getRequestDispatcher("booking.jsp?event_id=" + request.getParameter("event_id")); 
						rd.forward(request, response); 
					} else if (status.equals("existed")) { 
							request.setAttribute("status", "Date not available for event"); 
							RequestDispatcher rd = request.getRequestDispatcher("booking.jsp?event_id=" + request.getParameter("event_id")); 
							rd.forward(request, response); 
							} 
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}
	
	public String getServletInfo() {
		return "Short description";
	}
	
}
