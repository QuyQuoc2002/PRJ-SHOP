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
        AccountContactDAO accountContactDAO = new AccountContactDAO();
        
        String type = request.getParameter("type");
        Account account = (Account) session.getAttribute("accountCur");
        AccountDetail accountDetail = (AccountDetail) session.getAttribute("accountDetail");

        switch (type) {
            case "changePassword": {
                String oldPass = request.getParameter("oldPass");
                String newPass = request.getParameter("newPass");
                String reNewPass = request.getParameter("reNewPass");
                if (!oldPass.equals(account.getAccountPassword())) {
                    session.setAttribute("msgchangePassword", "Password is wrong, please again");
                } else {
                    if (!newPass.equals(reNewPass)) {
                        session.setAttribute("msgchangePassword", "Renew Password is not match");
                    } else {
                        boolean isChangePasswordSuccess = accountDAO.changePassword(account.getAccountId(), newPass);
                        if (isChangePasswordSuccess) {
                            account.setAccountPassword(newPass);
                            session.setAttribute("accountCur", account);
                            session.setAttribute("msgchangePassword", "Change password Success");
                        } else {
                            session.setAttribute("msgchangePassword", "Change password Fail");
                        }
                    }
                }
            }
            break;
            case "changeInformation": {
                String accountDetailName = request.getParameter("accountDetailName");
                Date accountDetailDob = request.getParameter("accountDetailDob").equals("") ? null : Date.valueOf(request.getParameter("accountDetailDob"));
                accountDetail.setAccountDetailName(accountDetailName);
                accountDetail.setAccountDetailDob(accountDetailDob);
                boolean isChangeInformationSuccess = accountDetailDAO.update(accountDetail, account.getAccountId());
                session.setAttribute("accountDetail", accountDetail);
                if (isChangeInformationSuccess) {
                    session.setAttribute("msgchangeInformation", "Change Information Success");
                } else {
                    session.setAttribute("msgchangeInformation", "Change Information Fail");
                }
            }
            case "updateAddress": {
                String choice = request.getParameter("choice");
                int accountContactId = Integer.parseInt(request.getParameter("accountContactId"));
                accountContactDAO.setAccountContactDefaut(accountContactId);
                session.setAttribute("msgUpdate", "addressContact");     
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
