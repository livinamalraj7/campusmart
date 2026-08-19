package com.campusmart.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/remove-cart")
public class RemoveCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String productName = request.getParameter("name");

        HttpSession session = request.getSession();

        List<String> cart =
                (List<String>) session.getAttribute("cart");

        if (cart != null && productName != null) {

            cart.removeIf(product ->
                    product.startsWith(productName + "|"));

            session.setAttribute("cart", cart);
        }

        response.sendRedirect("cart.jsp");
    }
}