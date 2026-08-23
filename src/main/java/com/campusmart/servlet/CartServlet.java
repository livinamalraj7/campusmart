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

        HttpSession session = request.getSession();

        List<String> cart =
                (List<String>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        if (name != null && price != null) {
            String product = name + "|" + category + "|" + price + "|" + icon;
            cart.add(product);
        }

        session.setAttribute("cart", cart);

        response.sendRedirect(request.getContextPath() + "/cart.jsp");
    }
}