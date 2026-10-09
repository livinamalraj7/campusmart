package com.campusmart.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    // Return a suitable icon when the stored icon is missing or corrupted
    private String getFallbackIcon(String category) {

        if (category == null) {
            return "📦";
        }

        switch (category.trim().toLowerCase()) {
            case "books":
                return "📚";

            case "electronics":
                return "🧮";

            case "stationery":
                return "📒";

            case "lab essentials":
                return "🥼";

            default:
                return "📦";
        }
    }

    // Correct missing or corrupted icons
    private String fixIcon(String icon, String category) {

        if (icon == null
                || icon.trim().isEmpty()
                || icon.trim().matches("\\?+")) {

            return getFallbackIcon(category);
        }

        return icon.trim();
    }

    // Retrieve a product directly from the database using its ID
    private String getProductFromDatabase(int id)
            throws Exception {

        String sql =
                "SELECT name, category, price, image "
                + "FROM products WHERE id = ?";

        try (Connection connection = DBConnection.getConnection()) {

            if (connection == null) {
                throw new Exception("Database connection failed.");
            }

            try (PreparedStatement statement =
                         connection.prepareStatement(sql)) {

                statement.setInt(1, id);

                try (ResultSet resultSet = statement.executeQuery()) {

                    if (resultSet.next()) {

                        String name = resultSet.getString("name");
                        String category =
                                resultSet.getString("category");
                        String price =
                                resultSet.getString("price");
                        String icon =
                                resultSet.getString("image");

                        icon = fixIcon(icon, category);

                        return name + "|"
                                + (category == null ? "" : category)
                                + "|"
                                + price
                                + "|"
                                + icon;
                    }
                }
            }
        }

        return null;
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();

        @SuppressWarnings("unchecked")
        List<String> cart =
                (List<String>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        String idParameter = request.getParameter("id");
        String action = request.getParameter("action");
        String change = request.getParameter("change");

        /*
         * ADD PRODUCT USING DATABASE ID
         */
        if (idParameter != null
                && !idParameter.trim().isEmpty()) {

            try {
                int id = Integer.parseInt(idParameter);

                if (id > 0) {
                    String product = getProductFromDatabase(id);

                    if (product != null) {
                        cart.add(product);
                    }
                }

            } catch (NumberFormatException e) {
                System.out.println("Invalid product ID.");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        /*
         * SUPPORT OLDER LINKS FROM THE PRODUCTS PAGE
         */
        else {

            String name = request.getParameter("name");
            String category = request.getParameter("category");
            String price = request.getParameter("price");
            String icon = request.getParameter("icon");

            if (name != null
                    && !name.trim().isEmpty()
                    && price != null
                    && !price.trim().isEmpty()) {

                icon = fixIcon(icon, category);

                String product =
                        name + "|"
                        + (category == null ? "" : category)
                        + "|"
                        + price
                        + "|"
                        + icon;

                cart.add(product);
            }
        }

        /*
         * CHANGE PRODUCT QUANTITY
         */
        if ("change".equals(action)) {

            String productName =
                    request.getParameter("productName");

            int quantityChange = 0;

            try {
                quantityChange = Integer.parseInt(change);
            } catch (Exception e) {
                quantityChange = 0;
            }

            if (productName != null
                    && !productName.trim().isEmpty()
                    && quantityChange != 0) {

                /*
                 * INCREASE QUANTITY
                 */
                if (quantityChange > 0) {

                    for (int i = 0; i < cart.size(); i++) {

                        String product = cart.get(i);

                        if (product.startsWith(productName + "|")) {
                            cart.add(product);
                            break;
                        }
                    }
                }

                /*
                 * DECREASE QUANTITY
                 */
                else {

                    for (int i = 0; i < cart.size(); i++) {

                        String product = cart.get(i);

                        if (product.startsWith(productName + "|")) {
                            cart.remove(i);
                            break;
                        }
                    }
                }
            }
        }

        // Save the updated cart
        session.setAttribute("cart", cart);

        // Open the cart page
        response.sendRedirect(
                request.getContextPath() + "/cart.jsp"
        );
    }
}