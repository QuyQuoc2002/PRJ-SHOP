/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package client.controller;

import dao.AccountDetailDAO;
import dao.AddressContactDAO;
import entity.Account;
import entity.AccountDetail;
import entity.AddressContact;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import service.AccountDetailService;
import service.AddressContactService;

/**
 *
 * @author DELL
 */
@WebServlet(name = "AddressEditController", urlPatterns = {"/addressEdit"})
public class AddressEditController extends HttpServlet {

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
            Account account = (Account) session.getAttribute("loginAccount");
            String type = request.getParameter("type");
            int idAddressContact;
            AccountDetail accountDetail = new AccountDetailService().getOneByIdAccount(account.getId());
            System.out.println(type);
            switch (type) {
                case "Delete":
                    idAddressContact = Integer.parseInt(request.getParameter("id"));
                    new AddressContactService().delete(idAddressContact);
                    break;
                case "Set Default":
                    idAddressContact = Integer.parseInt(request.getParameter("id"));
                    List<AddressContact> lstAC = new AddressContactService().getAllByAccountDetailId(accountDetail.getId());
                    for (AddressContact ac : lstAC) {
                        new AddressContactService().update(false, ac.getId());
                    }
                    new AddressContactService().update(true, idAddressContact);
                    break;
                case "Edit":
                    idAddressContact = Integer.parseInt(request.getParameter("id"));
                    String nameContact = request.getParameter("nameContact");
                    String phoneContact = request.getParameter("phoneContact");
                    String address = request.getParameter("address");
                    new AddressContactService().update(nameContact, phoneContact, address, idAddressContact);
                    break;
                case "ADD MORE":
                    AddressContact obj = AddressContact.builder()
                            .idAccountDetail(accountDetail.getId())
                            .address(request.getParameter("address"))
                            .nameContact(request.getParameter("nameContact"))
                            .phoneContact(request.getParameter("phoneContact"))
                            .addressDefault(false)
                            .build();
                    new AddressContactService().add(obj);
                    break;
            }
            session.setAttribute("messageEdited", "address edited");
            response.sendRedirect("profile");
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
