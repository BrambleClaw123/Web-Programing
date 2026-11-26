package com.example.baitapc6.business;

import com.example.baitapc6.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;

@WebServlet("/emailList")
public class EmailListServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Request attributes: current date and year (used by footer)
        request.setAttribute("currentDate", new Date());
        request.setAttribute("year", new GregorianCalendar().get(GregorianCalendar.YEAR));

        String action = request.getParameter("action");
        if (action == null) {
            action = "join";
        }

        String url = "/index.jsp";
        if (action.equals("add")) {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");

            User user = new User(firstName, lastName, email);
            request.setAttribute("user", user);

            // Session attribute: ArrayList of User objects
            HttpSession session = request.getSession();
            @SuppressWarnings("unchecked")
            ArrayList<User> users = (ArrayList<User>) session.getAttribute("users");
            if (users == null) {
                users = new ArrayList<>();
            }
            users.add(user);
            session.setAttribute("users", users);

            url = "/thanks.jsp";
        }
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
