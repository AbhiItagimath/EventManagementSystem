package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "deleteClient", urlPatterns = { "/deleteClient" })
public class DeleteClient extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kanasu?user=root&password=Abhi@7411");
            String cid = request.getParameter("cid");
            String deleteQuery = "DELETE FROM customer WHERE cid = ?";
            PreparedStatement ps = con.prepareStatement(deleteQuery);
            ps.setString(1, cid);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                request.setAttribute("status", "Client deleted successfully");
            } else {
                request.setAttribute("status", "Client not found or error deleting client");
            }
            request.getRequestDispatcher("clients.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("status", "Error deleting client");
            request.getRequestDispatcher("clients.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
