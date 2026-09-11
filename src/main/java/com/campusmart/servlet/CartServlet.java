package com.campusmart.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String price = request.getParameter("price");
        String icon = request.getParameter("icon");

        String action = request.getParameter("action");
        String change = request.getParameter("change");

        HttpSession session = request.getSession();

        List<String> cart =
                (List<String>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        /*
         * ADD PRODUCT
         */
        if (name != null && !name.trim().isEmpty()
                && price != null && !price.trim().isEmpty()) {

            String product =
                    name + "|" +
                    (category == null ? "" : category) + "|" +
                    price + "|" +
                    (icon == null ? "" : icon);

            cart.add(product);
        }

        /*
         * CHANGE QUANTITY
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

                if (quantityChange > 0) {

                    /*
                     * Find an existing product and duplicate it
                     * to increase the quantity.
                     */
                    for (String product : cart) {

                        if (product.startsWith(productName + "|")) {

                            cart.add(product);
                            break;
                        }
                    }

                } else {

                    /*
                     * Remove only one copy when quantity decreases.
                     */
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

        session.setAttribute("cart", cart);

        /*
         * Redirect to cart page
         */
        response.sendRedirect(
                request.getContextPath() + "/cart.jsp"
        );
    }
}