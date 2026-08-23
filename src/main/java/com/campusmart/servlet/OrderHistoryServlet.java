package com.campusmart.servlet;

import com.campusmart.model.Order;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/my-orders")
public class OrderHistoryServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String userEmail =
                (String) session.getAttribute("userEmail");

        // User must be logged in
        if (userEmail == null || userEmail.isEmpty()) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Order> orders = new ArrayList<>();

        String sql =
                "SELECT id, product_name, category, price, " +
                "quantity, order_date " +
                "FROM orders " +
                "WHERE user_email = ? " +
                "ORDER BY order_date DESC";

        try (
            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql)
        ) {

            statement.setString(1, userEmail);

            ResultSet resultSet =
                    statement.executeQuery();

            while (resultSet.next()) {

                Order order = new Order();

                order.setId(
                        resultSet.getInt("id")
                );

                order.setProductName(
                        resultSet.getString("product_name")
                );

                order.setCategory(
                        resultSet.getString("category")
                );

                order.setPrice(
                        resultSet.getDouble("price")
                );

                order.setQuantity(
                        resultSet.getInt("quantity")
                );

                order.setOrderDate(
                        resultSet.getTimestamp("order_date")
                );

                orders.add(order);
            }

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "error",
                    "Unable to load your orders."
            );
        }

        request.setAttribute("orders", orders);

        request.getRequestDispatcher(
                "/my-orders.jsp"
        ).forward(request, response);
    }
}