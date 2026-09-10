package com.campusmart.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

            /*
             * Group duplicate products and calculate quantity.
             *
             * Cart format:
             *
             * name|category|price|icon
             */

            Map<String, Integer> quantityMap =
                    new HashMap<>();

            Map<String, String> productMap =
                    new HashMap<>();

            for (String product : cart) {

                if (product == null) {
                    continue;
                }

                String[] details =
                        product.split("\\|", -1);

                if (details.length < 3) {
                    continue;
                }

                String name = details[0];

                /*
                 * Use product name as the key.
                 */
                quantityMap.put(
                        name,
                        quantityMap.getOrDefault(
                                name,
                                0
                        ) + 1
                );

                /*
                 * Store the complete product information.
                 */
                productMap.put(
                        name,
                        product
                );
            }

            connection = DBConnection.getConnection();

            String sql =
                    "INSERT INTO orders " +
                    "(user_email, product_name, category, price, quantity) " +
                    "VALUES (?, ?, ?, ?, ?)";

            statement =
                    connection.prepareStatement(sql);

            /*
             * Insert one row for each unique product.
             */
            for (String productName :
                    quantityMap.keySet()) {

                String product =
                        productMap.get(productName);

                String[] details =
                        product.split("\\|", -1);

                String name =
                        details[0];

                String category =
                        details.length > 1
                                ? details[1]
                                : "";

                double price =
                        details.length > 2
                                ? Double.parseDouble(
                                        details[2])
                                : 0;

                int quantity =
                        quantityMap.get(productName);

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
                        quantity
                );

                statement.executeUpdate();
            }

            /*
             * Remove cart only after successful insertion.
             */
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