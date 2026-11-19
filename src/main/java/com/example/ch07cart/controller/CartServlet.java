package com.example.ch07cart.controller;

import com.example.ch07cart.model.Cart;
import com.example.ch07cart.model.LineItem;
import com.example.ch07cart.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(value = "/cart")
public class CartServlet extends HttpServlet {

    private static final Map<String, Product> PRODUCT_DB = new HashMap<>();
    static {
        PRODUCT_DB.put("p01", new Product("p01", "86 (the band) - True Life Songs and Pictures", 13.95));
        PRODUCT_DB.put("p02", new Product("p02", "Paddlefoot - The first CD", 12.95));
        PRODUCT_DB.put("p03", new Product("p03", "Paddlefoot - The second CD", 11.95));
        PRODUCT_DB.put("p04", new Product("p04", "Joe Rut - Genuine Wood Grained Finish", 10.95));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if ("shop".equals(action)) {
            response.sendRedirect("index.jsp");
            return;
        }

        String productCode = request.getParameter("productCode");
        String quantityStr = request.getParameter("quantity");

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }

        if ("add".equals(action) && productCode != null) {
            Product product = PRODUCT_DB.get(productCode);
            if (product != null) {
                LineItem lineItem = new LineItem(product, 1);
                cart.addItem(lineItem);
            }
            session.setAttribute("cart", cart);
        }
        else if (productCode != null && quantityStr != null) {
            try {
                int newQty = Integer.parseInt(quantityStr.trim());
                cart.updateItem(productCode, newQty);
                session.setAttribute("cart", cart);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        request.getRequestDispatcher("/cart.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}