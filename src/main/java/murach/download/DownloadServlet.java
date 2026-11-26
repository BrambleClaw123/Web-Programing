package murach.download;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import murach.business.User;

import java.io.IOException;

@WebServlet("/download")
public class DownloadServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "viewAlbums";
        }

        String url = "/index.jsp";
        switch (action) {
            case "viewAlbums" -> url = "/index.jsp";
            case "checkUser" -> url = checkUser(request);
            case "viewCookies" -> url = "/view_cookies.jsp";
            case "deleteCookies" -> {
                deleteCookies(request, response);
                url = "/index.jsp";
            }
            default -> url = "/index.jsp";
        }
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String url = "/index.jsp";
        if ("registerUser".equals(action)) {
            url = registerUser(request, response);
        }
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    private String checkUser(HttpServletRequest request) {
        String productCode = request.getParameter("productCode");
        HttpSession session = request.getSession();
        session.setAttribute("productCode", productCode);

        User user = (User) session.getAttribute("user");
        if (user == null) {
            // try to recover the user from the cookies
            Cookie[] cookies = request.getCookies();
            String email = CookieUtil.getCookieValue(cookies, "emailCookie");
            if (email == null || email.isEmpty()) {
                return "/register.jsp";
            }
            String firstName = CookieUtil.getCookieValue(cookies, "firstNameCookie");
            session.setAttribute("user", new User(firstName, "", email));
        }
        return "/download.jsp";
    }

    private String registerUser(HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("email");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");

        User user = new User(firstName, lastName, email);
        request.getSession().setAttribute("user", user);

        addCookie(response, "emailCookie", email);
        addCookie(response, "firstNameCookie", firstName);
        return "/download.jsp";
    }

    private void addCookie(HttpServletResponse response, String name, String value) {
        Cookie c = new Cookie(name, value == null ? "" : value);
        c.setMaxAge(60 * 60 * 24 * 365 * 2);
        c.setPath("/");
        response.addCookie(c);
    }

    private void deleteCookies(HttpServletRequest request, HttpServletResponse response) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("emailCookie") || c.getName().equals("firstNameCookie")) {
                    c.setMaxAge(0);
                    c.setPath("/");
                    response.addCookie(c);
                }
            }
        }
        request.getSession().invalidate();
    }
}
