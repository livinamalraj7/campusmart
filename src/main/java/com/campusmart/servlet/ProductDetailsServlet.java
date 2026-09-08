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

        if (idParameter == null || idParameter.isEmpty()) {
            response.sendRedirect("products");
            return;
        }

        try {

            int id = Integer.parseInt(idParameter);

            Connection connection = DBConnection.getConnection();

            String sql = "SELECT * FROM products WHERE id = ?";

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            statement.setInt(1, id);

            ResultSet resultSet =
                    statement.executeQuery();

            if (resultSet.next()) {

                Product product = new Product();

                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("name"));
                product.setCategory(resultSet.getString("category"));
                product.setPrice(resultSet.getDouble("price"));
                product.setDescription(resultSet.getString("description"));
                product.setImage(resultSet.getString("image"));

                request.setAttribute("product", product);

                resultSet.close();
                statement.close();
                connection.close();

                request.getRequestDispatcher("/product-details.jsp")
                       .forward(request, response);

            } else {

                resultSet.close();
                statement.close();
                connection.close();

                response.sendRedirect("products");
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect("products");
        }
    }
}