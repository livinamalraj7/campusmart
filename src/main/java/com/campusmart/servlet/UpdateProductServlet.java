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

@WebServlet("/update-product")
public class UpdateProductServlet extends HttpServlet {

    @Override
    protected void doPost(
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

        String idParameter =
                request.getParameter("id");

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


        // Validate product ID
        if (idParameter == null ||
            idParameter.trim().isEmpty()) {

            response.sendRedirect(
                    "my-products?error=invalid"
            );
            return;
        }

        int productId;

        try {

            productId =
                    Integer.parseInt(idParameter.trim());

        } catch (NumberFormatException e) {

            response.sendRedirect(
                    "my-products?error=invalid"
            );
            return;
        }


        // Validate required fields
        if (name == null ||
            name.trim().isEmpty() ||

            category == null ||
            category.trim().isEmpty() ||

            priceParameter == null ||
            priceParameter.trim().isEmpty() ||

            description == null ||
            description.trim().isEmpty()) {

            response.sendRedirect(
                    "edit-product?id=" +
                    productId +
                    "&error=empty"
            );
            return;
        }


        // Validate price
        BigDecimal price;

        try {

            price =
                    new BigDecimal(
                            priceParameter.trim()
                    );

            if (price.compareTo(BigDecimal.ZERO) <= 0) {

                response.sendRedirect(
                        "edit-product?id=" +
                        productId +
                        "&error=price"
                );

                return;
            }

        } catch (NumberFormatException e) {

            response.sendRedirect(
                    "edit-product?id=" +
                    productId +
                    "&error=price"
            );

            return;
        }


        name = name.trim();
        category = category.trim();
        description = description.trim();

        if (image != null) {
            image = image.trim();
        }


        /*
         * IMPORTANT:
         *
         * seller_id = ?
         *
         * This prevents one seller from
         * modifying another seller's product.
         */

        String sql =
                "UPDATE products " +
                "SET name = ?, " +
                "category = ?, " +
                "price = ?, " +
                "description = ?, " +
                "image = ? " +
                "WHERE id = ? " +
                "AND seller_id = ?";


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
            statement.setInt(6, productId);
            statement.setInt(7, sellerId);


            int rowsUpdated =
                    statement.executeUpdate();


            if (rowsUpdated > 0) {

                response.sendRedirect(
                        "my-products?success=updated"
                );

            } else {

                response.sendRedirect(
                        "my-products?error=notfound"
                );
            }


        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "edit-product?id=" +
                    productId +
                    "&error=server"
            );
        }
    }
}