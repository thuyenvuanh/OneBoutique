/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.Account;
import entities.Customer;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sessionbeans.AccountFacade;
import sessionbeans.CustomerFacade;

/**
 *
 * @author SE161502 Vu Anh Thuyen
 */
public class AuthenticationController extends HttpServlet {

    @EJB
    private CustomerFacade customerFacade;

    @EJB
    private AccountFacade accountFacade;
    
    

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getAttribute("action").toString();
        switch (action) {
            case "login_form":
            case "register_form":
                request.getRequestDispatcher(App.LAYOUT).forward(request, response);
                break;
            case "login":
                login(request, response);
                break;
            case "register":
                register(request, response);
                break;
            case "logout":
                logout(request, response);
                break;
            default:
                request.setAttribute("controller", "error");
                request.setAttribute("action", "index");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Account user = accountFacade.getAccount(email, password);
        if (user == null) {
            request.setAttribute("email", email);
            request.setAttribute("message", "Wrong email or password");
            request.setAttribute("action", "login_form");
        } else {
            request.getSession().setAttribute("user", user);
            String uri = (String) request.getSession().getAttribute("uri");
            if (uri != null) {
                String array[] = uri.split("/");
                request.setAttribute("controller", array[array.length - 2]);
                request.setAttribute("action", array[array.length - 1].replace(".do", ""));
            } else {
                request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
                return;
            }
        }
        request.getRequestDispatcher(App.LAYOUT).forward(request, response);
    }

    private void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("fullName"),
                email = request.getParameter("email"),
                password = request.getParameter("password"),
                passwordConfirm = request.getParameter("passwordConfirm"),
                username = request.getParameter("username"),
                phone = request.getParameter("phone"),
                address = request.getParameter("address"),
                message = "";
        request.setAttribute("fullName", fullName);
        request.setAttribute("email", email);
        request.setAttribute("username", username);
        request.setAttribute("phone", phone);
        request.setAttribute("address", address); 
        
        boolean checkEmail = accountFacade.isEmailExist(email);
        boolean checkUsername = accountFacade.isUsernameExist(username);
        boolean checkPhone = accountFacade.isPhoneExist(phone);
        int size = accountFacade.count();
        if (!checkEmail && !checkPhone && !checkUsername) {
            if (password.equals(passwordConfirm)) {
                Account user = new Account(size + 1, fullName, address, phone, email, username, password, true, "ROLE_CUSTOMER");
                accountFacade.create(user);
                Customer customer = new Customer(user.getId(), "normal", address);
                customerFacade.create(customer);
                user.setCustomer(customer);
                accountFacade.edit(user);
                request.getSession().setAttribute("user", user);
            }
            String uri = (String) request.getSession().getAttribute("uri");
            if (uri != null) {
                String array[] = uri.split("/");
                request.setAttribute("controller", array[array.length - 2]);
                request.setAttribute("action", array[array.length - 1].replace(".do", ""));
            } else {
                request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
                return;
            }
        } else {
            if (checkEmail) {
                message += "Email already exist<br/>";
            }
            if (checkUsername) {
                message += "Username already exist<br/>";
            }
            if (checkPhone) {
                message += "Phone number already exist";
            }
            request.setAttribute("message", message);
            request.setAttribute("action", "register_form");
        }
        request.getRequestDispatcher(App.LAYOUT).forward(request, response);
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getSession().invalidate();
        request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
    }

}
