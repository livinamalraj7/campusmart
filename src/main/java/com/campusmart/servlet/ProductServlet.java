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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        List<Product> productList = new ArrayList<>();

        String category = request.getParameter("category");
        System.out.println("CATEGORY RECEIVED = " + category);

        try {

            Connection connection = DBConnection.getConnection();

            String sql;

            if (category == null || category.isEmpty()) {

                sql = "SELECT * FROM products";

            } else {

                sql = "SELECT * FROM products WHERE category = ?";
            }

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            if (category != null && !category.isEmpty()) {

                statement.setString(1, category);
            }

            ResultSet resultSet =
                    statement.executeQuery();

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

                productList.add(product);
            }

            resultSet.close();
            statement.close();
            connection.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        request.setAttribute("products", productList);

        request.getRequestDispatcher("/products.jsp")
               .forward(request, response);
    }
}