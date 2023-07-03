/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountContactDAO;
import dao.AccountDAO;
import dao.AccountDetailDAO;
import entity.Account;
import entity.AccountContact;
import entity.AccountDetail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author DELL
 */
@WebServlet(name = "ProfileController", urlPatterns = {"/profile"})
public class ProfileController extends HttpServlet {

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
            out.println("<title>Servlet ProfileController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("accountCur");
        AccountContactDAO accountContactDAO = new AccountContactDAO();
        List<AccountContact> lstAccountContact = accountContactDAO.getAll(account.getAccountId());
        request.setAttribute("lstAccountContact", lstAccountContact);
        request.getRequestDispatcher("profile.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        AccountDAO accountDAO = new AccountDAO();
        AccountDetailDAO accountDetailDAO = new AccountDetailDAO();
        Account account = (Account) session.getAttribute("accountCur");
        AccountContactDAO accountContactDAO = new AccountContactDAO();
        AccountDetail accountDetail = (AccountDetail) session.getAttribute("accountDetail");

        String type = request.getParameter("type");
        switch (type) {
            case "changeInformation": {
                String accountDetailName = request.getParameter("accountDetailName");
                Date accountDetailDob = request.getParameter("accountDetailDob").equals("") ? null : Date.valueOf(request.getParameter("accountDetailDob"));
                accountDetailDAO.update(accountDetailName, accountDetailDob, account.getAccountId());
                accountDetail.setAccountDetailName(accountDetailName);
                accountDetail.setAccountDetailDob(accountDetailDob);
                break;
            }
            
            case "changePassword": {
                String oldPass = request.getParameter("oldPass");
                String newPass = request.getParameter("newPass");
                String reNewPass = request.getParameter("reNewPass");

                if (!oldPass.equals(account.getAccountPassword())) {
                    session.setAttribute("msg", "old Password is wrong");
                } else {
                    if (newPass.equals(oldPass)) {
                        session.setAttribute("msg", "new and old is equal enter again");
                    } else {
                        if (!newPass.equals(reNewPass)) {
                            session.setAttribute("msg", "new and renew is not equal enter again");
                        } else {
                            boolean isChangePasswordSucces = accountDAO.changePassword(account.getAccountId(), newPass);
                            account.setAccountPassword(newPass);
                            session.setAttribute("accountCur", account);
                            if (isChangePasswordSucces) {
                                session.setAttribute("msg", "Change password Success");
                            } else {
                                session.setAttribute("msg", "Change password Fail");
                            }
                        }
                    }
                }
                break;
            }
            
            case "addAccountContact": {
                String accountContactName = request.getParameter("accountContactName");
                String accountContactMobile = request.getParameter("accountContactMobile");
                String accountContactAddress = request.getParameter("accountContactAddress");
                AccountContact accountContact = AccountContact.builder()
                        .accountId(account.getAccountId())
                        .accountContactAddress(accountContactAddress)
                        .accountContactName(accountContactName)
                        .accountContactMobile(accountContactMobile)
                        .build();
                accountContactDAO.add(accountContact);
                session.setAttribute("addressTab", "true");
                break;
            }
            
            case "updateAccountContact": {
                String typeUpdate = request.getParameter("typeUpdate");
                int accountContactId = Integer.parseInt(request.getParameter("accountContactId"));
                switch (typeUpdate) {
                    case "Set Default": {
                        accountContactDAO.setAccountContactDefaut(accountContactId);
                        break;
                    }
                    case "Delete": {
                        accountContactDAO.delete(accountContactId);
                        break;
                    }
                    case "Edit": {
                        String accountContactName = request.getParameter("accountContactName");
                        String accountContactMobile = request.getParameter("accountContactMobile");
                        String accountContactAddress = request.getParameter("accountContactAddress");
                        accountContactDAO.update(accountContactAddress, accountContactName, accountContactMobile, accountContactId);
                        break;
                    }
                }     
                session.setAttribute("addressTab", "true");
                break;
            }
        }

        response.sendRedirect("profile");
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
