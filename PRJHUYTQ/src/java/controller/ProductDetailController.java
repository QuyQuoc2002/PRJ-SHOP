/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import dao.ProductImgDetailDAO;
import dao.ProductSizeDAO;
import entity.Cart;
import entity.Category;
import entity.Product;
import entity.ProductImgDetail;
import entity.ProductSize;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author DELL
 */
@WebServlet(name = "ProductDetailController", urlPatterns = {"/product-detail"})
public class ProductDetailController extends HttpServlet {

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
            out.println("<title>Servlet ProductDetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductDetailController at " + request.getContextPath() + "</h1>");
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
        CategoryDAO categoryDAO = new CategoryDAO();
        ProductDAO productDAO = new ProductDAO();
        ProductImgDetailDAO productImgDetailDAO = new ProductImgDetailDAO();
        ProductSizeDAO productSizeDAO = new ProductSizeDAO();

        int productId = Integer.parseInt(request.getParameter("productId"));
        List<Category> lstCategory = categoryDAO.getAll();
        Product product = productDAO.getOne(productId);
        List<ProductImgDetail> lstProductImgDetail = productImgDetailDAO.getAll(productId);
        List<ProductSize> lstProductSize = productSizeDAO.getAll(productId);
        List<Product> lstRandProduct = productDAO.getRandByCategoryId(5, product.getCategoryId(), productId);

        request.setAttribute("lstCategory", lstCategory);
        request.setAttribute("lstRandProduct", lstRandProduct);
        request.setAttribute("product", product);
        request.setAttribute("lstProductImgDetail", lstProductImgDetail);
        request.setAttribute("lstProductSize", lstProductSize);
        request.getRequestDispatcher("product-detail.jsp").forward(request, response);
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
        ProductDAO productDAO = new ProductDAO();
        HttpSession session = request.getSession();

        List<Cart> lstCart = (List<Cart>) session.getAttribute("lstCart");
        int productId = Integer.parseInt(request.getParameter("productId"));
        String orderDetailSizeValue = request.getParameter("orderDetailSizeValue");
        int orderDetailQuantity = Integer.parseInt(request.getParameter("orderDetailQuantity"));
        Product product = productDAO.getOne(productId);
        int index = getOneCart(lstCart, productId, orderDetailSizeValue);
        if (index == -1) {
            Cart cart = Cart.builder()
                    .productId(productId)
                    .orderDetailProductImg(product.getProductImg())
                    .orderDetailProductName(product.getProductName())
                    .orderDetailPriceProduct(product.getProductPrice())
                    .orderDetailSizeValue(orderDetailSizeValue)
                    .orderDetailQuantity(orderDetailQuantity)
                    .build();
            lstCart.add(cart);
        } else {
            lstCart.get(index).setOrderDetailQuantity(orderDetailQuantity + lstCart.get(index).getOrderDetailQuantity());
        }
        response.sendRedirect("product-detail?productId=" + productId);
    }

    private int getOneCart(List<Cart> lstCart, int productId, String sizeValue) {
        for (int i = 0; i < lstCart.size(); i++) {
            if (lstCart.get(i).getProductId() == productId && lstCart.get(i).getOrderDetailSizeValue().equals(sizeValue)) {
                return i;
            }
        }
        return -1;
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
