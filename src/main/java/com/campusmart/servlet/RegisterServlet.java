package com.campusmart.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");
        String password = request.getParameter("password");
        String confirmPassword =
                request.getParameter("confirmPassword");

        // Check required values
        if (name == null || name.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            phone == null || phone.trim().isEmpty() ||
            role == null || role.trim().isEmpty() ||
            password == null || password.isEmpty() ||
            confirmPassword == null || confirmPassword.isEmpty()) {

            response.sendRedirect("register.jsp?error=empty");
            return;
        }

        // Check password length
        if (password.length() < 6) {
            response.sendRedirect("register.jsp?error=password");
            return;
        }

        // Check password confirmation
        if (!password.equals(confirmPassword)) {
            response.sendRedirect("register.jsp?error=mismatch");
            return;
        }

        String sql = "INSERT INTO users " +
                     "(name, email, phone, role, password) " +
                     "VALUES (?, ?, ?, ?, ?)";

        try (Connection connection =
                     DBConnection.getConnection();

             PreparedStatement statement =
                     connection.prepareStatement(sql)) {

            statement.setString(1, name.trim());
            statement.setString(2, email.trim());
            statement.setString(3, phone.trim());
            statement.setString(4, role);
            statement.setString(5, password);

            statement.executeUpdate();

            response.sendRedirect(
                    "register.jsp?success=registered");

        } catch (SQLException e) {

            e.printStackTrace();

            // Duplicate email or phone
            if (e.getErrorCode() == 1062) {

                String message = e.getMessage();

                if (message != null &&
                    message.contains("email")) {

                    response.sendRedirect(
                            "register.jsp?error=emailduplicate");

                } else if (message != null &&
                           message.contains("phone")) {

                    response.sendRedirect(
                            "register.jsp?error=phoneduplicate");

                } else {

                    response.sendRedirect(
                            "register.jsp?error=duplicate");
                }

            } else {

                response.sendRedirect(
                        "register.jsp?error=server");
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "register.jsp?error=server");
        }
    }
}