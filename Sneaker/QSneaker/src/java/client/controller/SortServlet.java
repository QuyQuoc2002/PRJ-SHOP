/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package client.controller;

import entity.Brand;
import entity.ModelSneaker;
import entity.Size;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import service.BrandService;
import service.ModelSneakerService;
import service.SizeService;

/**
 *
 * @author DELL
 */
@WebServlet(name = "SortServlet", urlPatterns = {"/sort"})
public class SortServlet extends HttpServlet {

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
            String sortBy = request.getParameter("sortBy");
            ModelSneakerService modelSneakerService = new ModelSneakerService();
            String[] words = sortBy.split(" ");
            List<ModelSneaker> lst = modelSneakerService.sort(words[0], words[1]);
            request.setAttribute("lst", lst);
            System.out.println(lst);
            
            BrandService brandService = new BrandService();
            List<Brand> lstBrand = brandService.getAll();
            request.setAttribute("lstBrand", lstBrand);
            
            SizeService sizeService = new SizeService();
            List<Size> lstSize = sizeService.getAll();
            request.setAttribute("lstSize", lstSize);
            
            request.setAttribute("flag", 0);
            
            request.getRequestDispatcher("shop.jsp").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException | SQLException e) {
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
