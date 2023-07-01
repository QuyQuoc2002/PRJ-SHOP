/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin.controller;

import entity.ModelSneaker;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import service.ModelSneakerService;
import service.ProductService;

/**
 *
 * @author DELL
 */
@WebServlet(name = "ModelEditServlet", urlPatterns = {"/modelEdit"})
public class ModelEditServlet extends HttpServlet {

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
            String type = request.getParameter("type");
            int idModel;
            switch (type) {
                case "Delete":
                    idModel = Integer.parseInt(request.getParameter("idModel"));
                    new ModelSneakerService().delete(idModel);
                    break;
                case "Edit":
                    idModel = Integer.parseInt(request.getParameter("idModel"));
                    String name = request.getParameter("nameModel");
                    int idBrand = Integer.parseInt(request.getParameter("idBrand"));
                    int price = Integer.parseInt(request.getParameter("price"));
                    int idStatus = Integer.parseInt(request.getParameter("idStatusModel"));
                    ModelSneaker ms = ModelSneaker.builder().name(name).idBrand(idBrand).price(price).idStatus(idStatus).build();
                    new ModelSneakerService().update(ms, idModel);
                    List<Product> lstPr = new ProductService().getAll(idModel);
                    for( Product p : lstPr) {
                        new ProductService().update(name, price, p.getId());
                    }
                         
                    break;
                case "Add More":
                    System.out.println("quoc");
                    String imgx = request.getParameter("img");
                    String namex = request.getParameter("name");
                    int idBrandx = Integer.parseInt(request.getParameter("idBrand"));
                    int pricex = Integer.parseInt(request.getParameter("price"));
                    System.out.println(pricex);
                    int idStatusx = Integer.parseInt(request.getParameter("idStatusModel"));
                    ModelSneaker msx = ModelSneaker.builder().img(imgx).name(namex).idBrand(idBrandx).price(pricex).idStatus(idStatusx).build();
                    new ModelSneakerService().add(msx);
                    break;
            }
            System.out.println("sd");
            response.sendRedirect("product-management");
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
