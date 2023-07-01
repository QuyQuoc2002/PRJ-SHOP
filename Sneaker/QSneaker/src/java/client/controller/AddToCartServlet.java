package client.controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import entity.Cart;
import entity.ModelSneaker;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.BrandService;
import service.ModelSneakerService;
import service.ProductService;
import service.SizeService;
//import model.ProductModel;
//import utils.NumberUtil;

/**
 *
 * @author nhatl
 */
@WebServlet(name = "AddToCartServlet", urlPatterns = {"/addtocart"})
public class AddToCartServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            int idModelSneaker = Integer.valueOf(request.getParameter("idModelSneaker"));
            int idSize;
            try {
                idSize = Integer.valueOf(request.getParameter("size"));
            } catch (Exception e) {
                idSize = 0;
            }
            
            HttpSession session = request.getSession();
            if(idSize != 0) {
                int quantity = Integer.valueOf(request.getParameter("quantity"));
                Product product = new ProductService().getOne(idModelSneaker, idSize);
                ModelSneaker modelSneaker = new ModelSneakerService().getOne(idModelSneaker);
                Cart cart = Cart.builder()
                        .productId(product.getId())
                        .name(modelSneaker.getName())
                        .brand(new BrandService().getOne(modelSneaker.getIdBrand()).getName())
                        .sizeValue(new SizeService().getOne(idSize).getSizeValue())
                        .img(modelSneaker.getImg())
                        .unitPrice(modelSneaker.getPrice())
                        .quantity(quantity)
                        .build();
                List<Cart> listOrder = null;
                listOrder = (ArrayList<Cart>) session.getAttribute("listCart");

                boolean flat = true;
                if (listOrder == null) {
                    listOrder = new ArrayList<>();
                    listOrder.add(cart);
                    session.setAttribute("listCart", listOrder);
                } else {
                    for (Cart c : listOrder) {
                        if (c.getProductId() == product.getId()) {
                            c.setQuantity(c.getQuantity() + quantity);
                            flat = false;
                        }
                    }
                    if (flat) {
                        listOrder.add(cart);
                        flat = true;
                    }
                    session.setAttribute("listCart", listOrder);
                }
                session.setAttribute("messageAddToCart", "Add to cart successful");
                response.sendRedirect("product-detail?id="+idModelSneaker);
            } else {
                session.setAttribute("messageAddToCart", "Please Select size");
                response.sendRedirect("product-detail?id="+idModelSneaker);
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
