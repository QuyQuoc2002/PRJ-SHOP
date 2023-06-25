/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package client.controller;

import entity.Brand;
import service.ModelSneakerService;
import entity.ModelSneaker;
import entity.Size;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import service.BrandService;
import service.SizeService;

/**
 *
 * @author DELL
 */
@WebServlet(name = "ModelSneakerServlet", urlPatterns = {"/shop"})
public class ShopServlet extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            /* TODO output your page here. You may use following sample code. */
 
            PrintWriter pr = response.getWriter();
            ModelSneakerService modelSneakerService = new ModelSneakerService();
//            List<ModelSneaker> lst = modelSneakerService.getAll();
//            request.setAttribute("lst", lst);

            List<ModelSneaker> lstNewProduct = modelSneakerService.getModelByIdStatus(1);
            request.setAttribute("lstNewProduct", lstNewProduct);

            BrandService brandService = new BrandService();
            List<Brand> lstBrand = brandService.getAll();
            request.setAttribute("lstBrand", lstBrand);
            
            SizeService sizeService = new SizeService();
            List<Size> lstSize = sizeService.getAll();
            request.setAttribute("lstSize", lstSize);
            
            //PAGINATION
            String pageStr = request.getParameter("page");
            int page = 1;

            if (pageStr != null) {
                page = Integer.parseInt(pageStr);
            }
          
            int numberProduct = 9;
            int totalProduct = modelSneakerService.getAll().size();
            int totalPage = (totalProduct % numberProduct == 0) ? totalProduct / numberProduct : totalProduct / numberProduct + 1;

            List<Integer> lsPage = new ArrayList<>();
            for (int i = 1; i <= totalPage; ++i) {
                lsPage.add(i);
            }

            List<ModelSneaker> lsProduct = modelSneakerService.getModelSneakerPerPage((page * numberProduct - numberProduct), numberProduct);

            request.setAttribute("page", page);
            request.setAttribute("lsPage", lsPage);
            request.setAttribute("lst", lsProduct);
            //END
            request.setAttribute("flag", 1);

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
