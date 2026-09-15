package com.campusmart.servlet;

import com.campusmart.model.Product;

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

@WebServlet("/my-products")
public class MyProductsServlet extends HttpServlet {

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

        // Only sellers can access this page
        if (userRole == null ||
            !"seller".equalsIgnoreCase(userRole) ||
            userIdObject == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        int sellerId = (Integer) userIdObject;

        List<Product> products = new ArrayList<>();

        String sql =
                "SELECT * FROM products " +
                "WHERE seller_id = ? " +
                "ORDER BY id DESC";

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

                    Product product = new Product();

                    product.setId(
                            resultSet.getInt("id")
                    );

                    product.setName(
                            resultSet.getString("name")
                    );

                    product.setCategory(
                            resultSet.getString("category")
                    );

                    product.setPrice(
                            resultSet.getDouble("price")
                    );

                    product.setDescription(
                            resultSet.getString("description")
                    );

                    product.setImage(
                            resultSet.getString("image")
                    );

                    int productSellerId =
                            resultSet.getInt("seller_id");

                    if (resultSet.wasNull()) {
                        product.setSellerId(null);
                    } else {
                        product.setSellerId(productSellerId);
                    }

                    products.add(product);
                }
            }

            request.setAttribute("products", products);

            request.getRequestDispatcher(
                    "/my-products.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "seller-dashboard.jsp?error=server"
            );
        }
    }
}