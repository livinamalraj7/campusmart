package com.campusmart.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/delete-product")
public class DeleteProductServlet extends HttpServlet {

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


        int sellerId =
                (Integer) userIdObject;


        String idParameter =
                request.getParameter("id");


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
                    Integer.parseInt(
                            idParameter.trim()
                    );

        } catch (NumberFormatException e) {

            response.sendRedirect(
                    "my-products?error=invalid"
            );

            return;
        }


        /*
         * IMPORTANT:
         *
         * The DELETE uses both product ID
         * and seller ID.
         *
         * Therefore a seller cannot delete
         * another seller's product.
         */

        String sql =
                "DELETE FROM products " +
                "WHERE id = ? " +
                "AND seller_id = ?";


        try (
            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql)
        ) {

            statement.setInt(1, productId);
            statement.setInt(2, sellerId);


            int rowsDeleted =
                    statement.executeUpdate();


            if (rowsDeleted > 0) {

                response.sendRedirect(
                        "my-products?success=deleted"
                );

            } else {

                response.sendRedirect(
                        "my-products?error=notfound"
                );
            }


        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "my-products?error=server"
            );
        }
    }
}