/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.OrderDAO;
import dao.OrderStatusDAO;
import entity.Order;
import entity.OrderStatus;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import utils.Helper;

/**
 *
 * @author DELL
 */
@WebServlet(name = "OrderManagementController", urlPatterns = {"/order-management"})
public class OrderManagementController extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderManagementController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderManagementController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        Properties properties = Helper.getPropertiesByFileName("const/const.properties");
        OrderStatusDAO orderStatusDAO = new OrderStatusDAO();
        OrderDAO orderDAO = new OrderDAO();
        
        List<OrderStatus> lstOrderStatus = orderStatusDAO.getAll();
        int pageCur = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
        int orderStatusId = request.getParameter("orderStatusId") == null ? 1 : Integer.parseInt(request.getParameter("orderStatusId"));
        int numberOrderPerPage = Integer.parseInt(properties.getProperty("numberOrderManagementPerPage"));
        List<Integer> lstPage = new ArrayList<>();
        int size = orderDAO.getSizeByOrderStatusIdForAdmin(orderStatusId);
        int totalPage = size % numberOrderPerPage == 0
                ? size / numberOrderPerPage
                : size / numberOrderPerPage + 1;
        for (int i = 1; i <= totalPage; i++) {
            lstPage.add(i);
        }
        List<Order> lstOrder = orderDAO.getAllByOrderStatusIdForAdmin(pageCur, numberOrderPerPage, orderStatusId);

        request.setAttribute("pageCur", pageCur);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("lstPage", lstPage);
        request.setAttribute("lstOrder", lstOrder);
        request.setAttribute("orderStatusId", orderStatusId);
        request.setAttribute("lstOrderStatus", lstOrderStatus);

        request.getRequestDispatcher("order-management.jsp").forward(request, response);
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
        OrderDAO orderDAO = new OrderDAO();
        
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        int orderStatusId = Integer.parseInt(request.getParameter("orderStatusId"));
        orderDAO.update(orderId, orderStatusId);
        
        response.sendRedirect("order-management?orderStatusId=" + (orderStatusId - 1));
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
