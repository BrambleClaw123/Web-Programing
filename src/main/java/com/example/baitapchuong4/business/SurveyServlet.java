package com.example.baitapchuong4.business;

import com.example.baitapchuong4.model.Survey;
import com.example.baitapchuong4.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;

public class SurveyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {
        String url = "/index.html";

        String action = request.getParameter("action");
        if (action == null) {
            action = "join";  // default action
        }

        // perform action and set URL to appropriate page
        if (action.equals("join")) {
            url = "/index.html";    // the "join" page
        }
        else if (action.equals("add")) {
            // get parameters from the request
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String dateOfBirth = request.getParameter("dateOfBirth");
            String heardFrom = request.getParameter("heardFrom");

            String wantsUpdatesChoice = request.getParameter("wantsUpdates");
            boolean wantsUpdates = false;
            if (wantsUpdatesChoice != null && !wantsUpdatesChoice.equals("")) wantsUpdates = true;

            String wantsEmailChoice = request.getParameter("wantsEmail");
            boolean wantsEmail = false;
            if (wantsEmailChoice != null && !wantsEmailChoice.equals("")) wantsEmail = true;

            String contactVia = request.getParameter("contactVia");
            // store data in User object and save User object in db

            User user = new User(firstName, lastName, LocalDate.parse(dateOfBirth), email);
            Survey survey = new Survey(heardFrom, wantsUpdates, wantsEmail, contactVia, new User());

            // set User object in request object and set URL
            request.setAttribute("survey", survey);
            request.setAttribute("user", user);
            url = "/thanks.jsp";   // the "thanks" page
        }

        // forward request and response objects to specified URL
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }
}

