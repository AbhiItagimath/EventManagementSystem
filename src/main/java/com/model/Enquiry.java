package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class Enquiry {
	
	private Connection con;
	HttpSession se;
	
	public Enquiry(HttpSession session) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kanasu?user=root&password=Abhi@7411");
			se = session;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	 public String signup(String name, String email, String pwd) {
	        PreparedStatement ps;
	        String status = "";
	        try {
	            Statement st = con.createStatement();
	            ResultSet rs = st.executeQuery("SELECT * FROM customer WHERE cemail='" + email + "';");
	            boolean b = rs.next();
	            if (b) {
	                status = "existed";
	            } else {
	                String query = "INSERT INTO customer (cname, cemail, cpassword) VALUES (?, ?, ?)";
	                ps = con.prepareStatement(query);
	                ps.setString(1, name);
	                ps.setString(2, email);
	                ps.setString(3, pwd);
	                int a = ps.executeUpdate();
	                if (a > 0) {
	                    status = "success";
	                } else {
	                    status = "failed";
	                }
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return status;
	    }


	 public String login(String email, String password, HttpSession session) {
		    String status = "", eid = "kanasuevents@gmail.com", pwd = "1234567890", em = "", nm = "", id = "";
		    if (email.equals(eid) && password.equals(pwd)) {
		        se = session;
		        id = "admin";
		        nm = "Admin";
		        session.setAttribute("uname", nm);
		        session.setAttribute("email", email);
		        session.setAttribute("id", id);
		        status = "adm success";
		    } else {
		        try {
		            se = session;
		            PreparedStatement ps = con.prepareStatement("SELECT * FROM customer WHERE cemail = ? AND cpassword = ?");
		            ps.setString(1, email);
		            ps.setString(2, password);
		            ResultSet rs = ps.executeQuery();
		            if (rs.next()) {
		            	System.out.println("Login successful for: " + email);
		                id = rs.getString("cid");
		                nm = rs.getString("cname");
		                em = rs.getString("cemail");
		                session.setAttribute("uname", nm);
		                session.setAttribute("email", em);
		                session.setAttribute("id", id);
		                status = "success";
		            } else {
		                status = "failure";
		            }
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		    }
		    return status;
		}


	
	 public String Booknow(HttpServletRequest request) {
		    String status = "";
		    ResultSet rs = null;
		    PreparedStatement ps = null;

		    try {
		        // Check if the date is already booked for any event
		        String checkDateQuery = "SELECT event_id FROM bookedevents WHERE eventdate = ?";
		        ps = con.prepareStatement(checkDateQuery);
		        ps.setString(1, request.getParameter("edate"));
		        rs = ps.executeQuery();
		        
		        if (rs.next()) {
		            status = "existed";
		        } else {
		            // Insert the booking details into the bookedevents table
		            String insertQuery = "INSERT INTO bookedevents (user_name, email, plan, cost, eventdate, address) " +
		                                 "VALUES (?, ?, ?, ?, ?, ?)";
		                                 
		            ps = con.prepareStatement(insertQuery);
		            ps.setString(1, request.getParameter("name"));
		            ps.setString(2, request.getParameter("email"));
		            ps.setString(3, request.getParameter("uplan"));
		            ps.setDouble(4, Double.parseDouble(request.getParameter("ecost")));
		            ps.setString(5, request.getParameter("edate"));
		            ps.setString(6, request.getParameter("address"));
		            
		            int result = ps.executeUpdate();
		            if (result > 0) {
		                status = "success";
		            } else {
		                status = "failure";
		            }
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    } 
		 
		    return status;
		}

	
	public String getUserId(String email) { 
		String userId = ""; 
		try { 
		PreparedStatement ps = con.prepareStatement("SELECT cid FROM customer WHERE cemail = ?");
		ps.setString(1, email); 
		ResultSet rs = ps.executeQuery(); 
		if (rs.next()) { 
		userId = rs.getString("cid"); 
		} 
		} catch (Exception e) { 
		e.printStackTrace(); 
		} 
		return userId; 
		}
	
	 public boolean updateEventStatus(int eventId, String status) {
	        boolean result = false;
	        PreparedStatement ps = null;
	        try {
	            String query = "UPDATE bookedevents SET status = ? WHERE event_id = ?";
	            ps = con.prepareStatement(query);
	            ps.setString(1, status);
	            ps.setInt(2, eventId);
	            int rowsAffected = ps.executeUpdate();
	            if (rowsAffected > 0) {
	                result = true;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } 
	        return result;
	    }

	 public ArrayList<Dproduct> geteventstatusAdmin() {
	        ArrayList<Dproduct> eventsList = new ArrayList<>();
	        Statement stmt = null;
	        ResultSet rs = null;
	        try {
	            stmt = con.createStatement();
	            rs = stmt.executeQuery("SELECT * FROM bookedevents");
	            while (rs.next()) {
	                Dproduct event = new Dproduct();
	                event.setEvent_id(rs.getString("event_id"));
	                event.setUser_name(rs.getString("user_name"));
	                event.setEmail(rs.getString("email"));
	                event.setPlan(rs.getString("plan"));
	                event.setCost(rs.getString("cost"));
	                event.setEventdate(rs.getString("eventdate"));
	                event.setBookeddate(rs.getString("bookeddate"));
	                event.setAddress(rs.getString("address"));
	                event.setStatus(rs.getString("status"));
	                eventsList.add(event);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } 
	        return eventsList;
	    }
	 
	 public ArrayList<User> getClients() {
		    ArrayList<User> clientsList = new ArrayList<>();
		    Statement stmt = null;
		    ResultSet rs = null;
		    try {
		        stmt = con.createStatement();
		        rs = stmt.executeQuery("SELECT cid, cname, cemail, signup_date FROM customer");
		        while (rs.next()) {
		            User client = new User();
		            client.setCid(rs.getString("cid"));
		            client.setCname(rs.getString("cname"));
		            client.setCemail(rs.getString("cemail"));
		            client.setSignupDate(rs.getString("signup_date"));
		            clientsList.add(client);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    } 
		    return clientsList;
		}

 
 public ArrayList<Dproduct> getEventsByUserEmail(String userEmail) {
	    ArrayList<Dproduct> events = new ArrayList<>();
	    try {
	        String query = "SELECT * FROM bookedevents WHERE email = ?";
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setString(1, userEmail);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Dproduct event = new Dproduct();
	            event.setEvent_id(rs.getString("event_id"));
	            event.setPlan(rs.getString("plan"));
	            event.setStatus(rs.getString("status"));
	            events.add(event);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return events;
	}


 public String submitEnquiry(String name, String email, String tel, String subject, String message) {
	    PreparedStatement ps = null;
	    String status = "";

	    try {
	        String query = "INSERT INTO enquiries (name, email, tel, subject, message, submitted_at) VALUES (?, ?, ?, ?, ?, now())";
	        ps = con.prepareStatement(query);
	        ps.setString(1, name);
	        ps.setString(2, email);
	        ps.setString(3, tel);
	        ps.setString(4, subject);
	        ps.setString(5, message);
	        
	        int result = ps.executeUpdate();
	        if (result > 0) {
	            status = "success";
	        } else {
	            status = "failure";
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } 
	    

	    return status;
	}
 	public ArrayList<UserEnquiry> getAllEnquiries() {
	    ArrayList<UserEnquiry> enquiriesList = new ArrayList<>();
	    Statement stmt = null;
	    ResultSet rs = null;
	    try {
	        String query = "SELECT id, name, email, tel, subject, message, submitted_at FROM enquiries";
	        stmt = con.createStatement();
	        rs = stmt.executeQuery(query);
	        while (rs.next()) {
	            UserEnquiry enquiry = new UserEnquiry();
	            enquiry.setId(rs.getInt("id"));
	            enquiry.setName(rs.getString("name"));
	            enquiry.setEmail(rs.getString("email"));
	            enquiry.setTel(rs.getString("tel"));
	            enquiry.setSubject(rs.getString("subject"));
	            enquiry.setMessage(rs.getString("message"));
	            enquiry.setSubmittedAt(rs.getTimestamp("submitted_at"));
	            enquiriesList.add(enquiry);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } 
	    return enquiriesList;
	}
 	
 	public String resetPassword(String email, String oldPassword, String newPassword) {
 	    PreparedStatement ps = null;
 	    ResultSet rs = null;
 	    String status = "";

 	    try {
 	        String query = "SELECT cpassword FROM customer WHERE cemail = ?";
 	        ps = con.prepareStatement(query);
 	        ps.setString(1, email);
 	        rs = ps.executeQuery();

 	        if (rs.next()) {
 	            String currentPassword = rs.getString("cpassword");
 	            if (currentPassword.equals(oldPassword)) {
 	                String updateQuery = "UPDATE customer SET cpassword = ? WHERE cemail = ?";
 	                ps = con.prepareStatement(updateQuery);
 	                ps.setString(1, newPassword);
 	                ps.setString(2, email);
 	                int result = ps.executeUpdate();
 	                if (result > 0) {
 	                    status = "success";
 	                } else {
 	                    status = "failure";
 	                }
 	            } else {
 	                status = "incorrectOldPassword";
 	            }
 	        } else {
 	            status = "failure";
 	        }
 	    } catch (Exception e) {
 	        e.printStackTrace();
 	        status = "failure";
 	    } finally {
 	        try {
 	            if (ps != null) ps.close();
 	        } catch (Exception e) {
 	            e.printStackTrace();
 	        }
 	    }

 	    return status;
 	}






	
}
