package murach.cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import murach.business.Product;
import murach.data.ProductIO;

import java.io.IOException;
import java.util.ArrayList;

// Mapped to /loadProducts in web.xml
public class ProductsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = getServletContext().getRealPath("/WEB-INF/products.txt");
        ArrayList<Product> products = ProductIO.getProducts(path);

        HttpSession session = request.getSession();
        session.setAttribute("products", products);

        getServletContext().getRequestDispatcher("/ch09-2/index.jsp").forward(request, response);
    }
}
