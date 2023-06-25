/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin.controller;

import entity.Account;
import entity.Brand;
import entity.ModelSneaker;
import entity.Order;
import entity.Product;
import entity.Size;
import entity.Status;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.AccountService;
import service.BrandService;
import service.ModelSneakerService;
import service.OrderService;
import service.ProductService;
import service.SizeService;
import service.StatusService;

/**
 *
 * @author DELL
 */
@WebServlet(name = "ProductManagementServlet", urlPatterns = {"/product-management"})
public class ProductManagementServlet extends HttpServlet {

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
        try {
            /* TODO output your page here. You may use following sample code. */
            List<Product> lstProduct = new ProductService().getAll();
            request.setAttribute("lstProduct", lstProduct);
            List<ModelSneaker> lstModel = new ModelSneakerService().getAll();
            request.setAttribute("lstModel", lstModel);
            List<Size> lstSize = new SizeService().getAll();
            request.setAttribute("lstSize", lstSize);
            List<Brand> lstBrand = new BrandService().getAll();
            request.setAttribute("lstBrand", lstBrand);
            List<Status> lstStatusModel = new StatusService().getAll("STATUS_MODEL");
            request.setAttribute("lstStatusModel", lstStatusModel);
            
            
            
            
            request.getRequestDispatcher("product-management.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("QSneaker/WEB-INF/error-404.jsp");
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
