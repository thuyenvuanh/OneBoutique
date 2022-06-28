/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.Account;
import entities.Customer;
import entities.OrderDetail;
import entities.OrderHeader;
import models.Cart;
import java.io.IOException;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sessionbeans.AccountFacade;
import sessionbeans.CustomerFacade;
import sessionbeans.OrderDetailFacade;
import sessionbeans.OrderHeaderFacade;
import sessionbeans.ProductFacade;

/**
 *
 * @author SE161293 Nguyen Minh Tam
 */
@WebServlet(name = "CheckoutController", urlPatterns = {"/checkout"})
public class CheckoutController extends HttpServlet {

    @EJB
    private CustomerFacade customerFacade;

    @EJB
    private ProductFacade productFacade;

    @EJB
    private OrderDetailFacade orderDetailFacade;

    @EJB
    private OrderHeaderFacade orderHeaderFacade;

    @EJB
    private AccountFacade af;

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
            case "index":
                index(request, response);
                break;
            case "pay":
                pay(request, response);
                break;
            default:
                request.setAttribute("controller", "error");
                request.setAttribute("action", "index");
        }
        request.getRequestDispatcher(App.LAYOUT).forward(request, response);
    }

    private void index(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        session.setAttribute("cart", cart);
    }

    private void pay(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        OrderHeader oh = new OrderHeader(orderHeaderFacade.count(), new Date());
        oh.setStatus("paid");
        Account user = (Account) session.getAttribute("user");
        oh.setCustomerId(customerFacade.find(user.getId()));
        orderHeaderFacade.create(oh);
        Cart cart = (Cart) session.getAttribute("cart");
        cart.getItems().forEach((item) -> {
            OrderDetail od = new OrderDetail(orderDetailFacade.count(), item.getQuantity(), item.getQuantity() * item.getPrice(), item.getDiscount());
            od.setOrderId(oh);
            od.setProductId(productFacade.find(item.getId()));
            orderDetailFacade.create(od);
        });
        session.setAttribute("cart", null);
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

}
