package com.campusmart.servlet;

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

@WebServlet("/seller-orders")
public class SellerOrdersServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String userRole =
                (String) session.getAttribute("userRole");

        Object userIdObject =
                session.getAttribute("userId");

        // Seller-only access
        if (userRole == null ||
            !"seller".equalsIgnoreCase(userRole) ||
            userIdObject == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        int sellerId = (Integer) userIdObject;

        List<SellerOrder> orders =
                new ArrayList<>();

        /*
         * Match orders with products using
         * product name and category.
         *
         * Only products belonging to the
         * logged-in seller are returned.
         */
        String sql =
                "SELECT o.id, " +
                "o.user_email, " +
                "o.product_name, " +
                "o.category, " +
                "o.price, " +
                "o.quantity, " +
                "o.order_date, " +
                "o.delivery_address " +
                "FROM orders o " +
                "INNER JOIN products p " +
                "ON o.product_name = p.name " +
                "AND o.category = p.category " +
                "WHERE p.seller_id = ? " +
                "ORDER BY o.order_date DESC";

        try (
            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql)
        ) {

            statement.setInt(1, sellerId);

            try (ResultSet resultSet =
                    statement.executeQuery()) {

                while (resultSet.next()) {

                    SellerOrder order =
                            new SellerOrder();

                    order.setId(
                            resultSet.getInt("id")
                    );

                    order.setUserEmail(
                            resultSet.getString("user_email")
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

                    order.setDeliveryAddress(
                            resultSet.getString(
                                    "delivery_address"
                            )
                    );

                    orders.add(order);
                }
            }

            request.setAttribute(
                    "sellerOrders",
                    orders
            );

            request.getRequestDispatcher(
                    "/seller-orders.jsp"
            ).forward(
                    request,
                    response
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "seller-dashboard.jsp?error=server"
            );
        }
    }


    /*
     * Simple inner class used to hold
     * seller order information.
     */
    public static class SellerOrder {

        private int id;
        private String userEmail;
        private String productName;
        private String category;
        private double price;
        private int quantity;
        private java.sql.Timestamp orderDate;
        private String deliveryAddress;


        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }


        public String getUserEmail() {
            return userEmail;
        }

        public void setUserEmail(String userEmail) {
            this.userEmail = userEmail;
        }


        public String getProductName() {
            return productName;
        }

        public void setProductName(String productName) {
            this.productName = productName;
        }


        public String getCategory() {
            return category;
        }

        public void setCategory(String category) {
            this.category = category;
        }


        public double getPrice() {
            return price;
        }

        public void setPrice(double price) {
            this.price = price;
        }


        public int getQuantity() {
            return quantity;
        }

        public void setQuantity(int quantity) {
            this.quantity = quantity;
        }


        public java.sql.Timestamp getOrderDate() {
            return orderDate;
        }

        public void setOrderDate(
                java.sql.Timestamp orderDate) {

            this.orderDate = orderDate;
        }


        public String getDeliveryAddress() {
            return deliveryAddress;
        }

        public void setDeliveryAddress(
                String deliveryAddress) {

            this.deliveryAddress =
                    deliveryAddress;
        }
    }
}