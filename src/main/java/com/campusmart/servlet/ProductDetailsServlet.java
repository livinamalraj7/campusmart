package com.campusmart.servlet;

import com.campusmart.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/product-details")
public class ProductDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("PRODUCT DETAILS SERVLET CALLED");

        String idParameter = request.getParameter("id");

        // No product ID provided
        if (idParameter == null || idParameter.trim().isEmpty()) {
            response.sendRedirect("products?error=invalid");
            return;
        }

        int id;

        // Invalid product ID
        try {
            id = Integer.parseInt(idParameter);
        } catch (NumberFormatException e) {
            response.sendRedirect("products?error=invalid");
            return;
        }

        String sql = "SELECT * FROM products WHERE id = ?";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement =
                    connection.prepareStatement(sql)
        ) {

            statement.setInt(1, id);

            try (ResultSet resultSet = statement.executeQuery()) {

                if (resultSet.next()) {

                    Product product = new Product();

                    product.setId(resultSet.getInt("id"));
                    product.setName(resultSet.getString("name"));
                    product.setCategory(resultSet.getString("category"));
                    product.setPrice(resultSet.getDouble("price"));
                    product.setDescription(
                            resultSet.getString("description")
                    );
                    product.setImage(
                            resultSet.getString("image")
                    );

                    request.setAttribute("product", product);

                    request.getRequestDispatcher(
                            "/product-details.jsp"
                    ).forward(request, response);

                } else {

                    // Product ID does not exist
                    response.sendRedirect(
                            "products?error=notfound"
                    );
                }
            }

        } catch (Exception e) {

            e.printStackTrace();

            // Database/server error
            response.sendRedirect(
                    "products?error=server"
            );
        }
    }
}