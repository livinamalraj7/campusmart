package com.campusmart.servlet;

import com.campusmart.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

    private ProductDAO productDAO;

    @Override
    public void init() {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        List<Product> productList;

        String category = request.getParameter("category");

        System.out.println("CATEGORY RECEIVED = " + category);

        if (category == null || category.isEmpty()) {

            productList = productDAO.getAllProducts();

        } else {

            productList = productDAO.getProductsByCategory(category);
        }

        request.setAttribute("products", productList);

        request.getRequestDispatcher("/products.jsp")
               .forward(request, response);
    }
}