package com.campusmart.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("cart");
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String userEmail =
                (String) session.getAttribute("userEmail");

        List<String> cart =
                (List<String>) session.getAttribute("cart");

        // Check login
        if (userEmail == null || userEmail.isEmpty()) {

            response.sendRedirect("login.jsp");
            return;
        }

        // Check cart
        if (cart == null || cart.isEmpty()) {

            response.sendRedirect("cart");
            return;
        }

        Connection connection = null;
        PreparedStatement statement = null;

        try {

            connection = DBConnection.getConnection();

            String sql =
                    "INSERT INTO orders " +
                    "(user_email, product_name, category, price, quantity) " +
                    "VALUES (?, ?, ?, ?, ?)";

            statement =
                    connection.prepareStatement(sql);

            for (String product : cart) {

                /*
                 * Cart format:
                 *
                 * name|category|price|icon
                 */

                String[] details =
                        product.split("\\|");

                String name = details[0];

                String category = details[1];

                double price =
                        Double.parseDouble(details[2]);

                statement.setString(
                        1,
                        userEmail
                );

                statement.setString(
                        2,
                        name
                );

                statement.setString(
                        3,
                        category
                );

                statement.setDouble(
                        4,
                        price
                );

                statement.setInt(
                        5,
                        1
                );

                statement.executeUpdate();
            }

            // Remove cart only after successful insertion
            session.removeAttribute("cart");

            response.sendRedirect(
                    "order-success.jsp"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType(
                    "text/html;charset=UTF-8"
            );

            response.getWriter().println(
                    "<h2>Order could not be placed.</h2>"
            );

            response.getWriter().println(
                    "<p>Error: " +
                    e.getMessage() +
                    "</p>"
            );

        } finally {

            try {

                if (statement != null) {
                    statement.close();
                }

                if (connection != null) {
                    connection.close();
                }

            } catch (Exception e) {

                e.printStackTrace();
            }
        }
    }
}