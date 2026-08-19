package com.campusmart.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String sql =
                "SELECT id, name, email, role FROM users " +
                "WHERE email = ? AND password = ?";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement =
                    connection.prepareStatement(sql)
        ) {

            statement.setString(1, email);
            statement.setString(2, password);

            ResultSet result = statement.executeQuery();

            if (result.next()) {

                HttpSession session = request.getSession();

                session.setAttribute("userId", result.getInt("id"));
                session.setAttribute("userName", result.getString("name"));
                session.setAttribute("userEmail", result.getString("email"));
                session.setAttribute("userRole", result.getString("role"));

                response.sendRedirect("index.jsp");

            } else {

                response.sendRedirect("login.jsp?error=invalid");

            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect("login.jsp?error=server");

        }
    }
}