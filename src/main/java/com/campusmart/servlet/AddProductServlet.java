package com.campusmart.servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/add-product")
public class AddProductServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // UTF-8 support for emojis and special characters
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session =
                request.getSession();

        String userRole =
                (String) session.getAttribute("userRole");

        Object userIdObject =
                session.getAttribute("userId");


        // Only sellers can add products
        if (userRole == null ||
            !"seller".equalsIgnoreCase(userRole) ||
            userIdObject == null) {

            response.sendRedirect("login.jsp");
            return;
        }


        int sellerId =
                (Integer) userIdObject;


        String name =
                request.getParameter("name");

        String category =
                request.getParameter("category");

        String priceParameter =
                request.getParameter("price");

        String description =
                request.getParameter("description");

        String image =
                request.getParameter("image");


        // Required field validation
        if (name == null ||
            name.trim().isEmpty() ||

            category == null ||
            category.trim().isEmpty() ||

            priceParameter == null ||
            priceParameter.trim().isEmpty() ||

            description == null ||
            description.trim().isEmpty()) {

            response.sendRedirect(
                    "add-product.jsp?error=empty"
            );

            return;
        }


        BigDecimal price;

        try {

            price =
                    new BigDecimal(
                            priceParameter.trim()
                    );

            if (price.compareTo(BigDecimal.ZERO) <= 0) {

                response.sendRedirect(
                        "add-product.jsp?error=price"
                );

                return;
            }

        } catch (NumberFormatException e) {

            response.sendRedirect(
                    "add-product.jsp?error=price"
            );

            return;
        }


        name = name.trim();
        category = category.trim();
        description = description.trim();

        if (image != null) {
            image = image.trim();
        }


        String sql =
                "INSERT INTO products " +
                "(name, category, price, description, image, seller_id) " +
                "VALUES (?, ?, ?, ?, ?, ?)";


        try (
            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql)
        ) {

            statement.setString(1, name);
            statement.setString(2, category);
            statement.setBigDecimal(3, price);
            statement.setString(4, description);
            statement.setString(5, image);
            statement.setInt(6, sellerId);

            statement.executeUpdate();


            response.sendRedirect(
                    "seller-dashboard.jsp?success=productadded"
            );


        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "add-product.jsp?error=server"
            );
        }
    }
}