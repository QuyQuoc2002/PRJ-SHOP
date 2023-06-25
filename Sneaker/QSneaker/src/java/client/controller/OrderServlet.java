/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package client.controller;

import entity.Account;
import entity.AddressContact;
import entity.Cart;
import entity.Order;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import service.AddressContactService;
import service.OrderDetailService;
import service.OrderService;

/**
 *
 * @author DELL
 */
@WebServlet(name = "OrderServlet", urlPatterns = {"/order"})
public class OrderServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            int id = Integer.valueOf(request.getParameter("idAC"));
            AddressContact ac = new AddressContactService().getOne(id);
            long total = Long.parseLong(session.getAttribute("totalPrice").toString());
            Order o = Order.builder()
                    .nameContact(ac.getNameContact())
                    .phoneContact(ac.getPhoneContact())
                    .address(ac.getAddress())
                    .idAccountDetail(ac.getIdAccountDetail())
                    .doneDate(null)
                    .idStatus(1)
                    .total(total
                    ).build();
            System.out.println(o);
            OrderService orderService = new OrderService();
            int orderId = orderService.addOrderReturnId(o);
            if (orderId != 0) {
                List<Cart> listOrder = null;
                listOrder = (ArrayList<Cart>) session.getAttribute("listCart");
                new OrderDetailService().addListCart(listOrder, orderId);
                session.removeAttribute("listCart");
                response.sendRedirect("thank.html");
            }

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

}
