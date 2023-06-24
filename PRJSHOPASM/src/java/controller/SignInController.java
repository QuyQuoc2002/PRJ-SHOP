/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import dao.AccountDetailDAO;
import entity.Account;
import entity.AccountDetail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
@WebServlet(name = "SignInController", urlPatterns = {"/sign-in"})
public class SignInController extends HttpServlet {

    private static final String REMEMBER_ME_COOKIE_USERNAME = "rememberMeUsername";
    private static final String REMEMBER_ME_COOKIE_PASSWORD = "rememberMePasword";
    private static final int REMEMBER_ME_COOKIE_MAX_AGE = 3600 * 24 * 30; // 30 days

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
            out.println("<title>Servlet SignInController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignInController at " + request.getContextPath() + "</h1>");
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
        AccountDAO accountDAO = new AccountDAO();
        AccountDetailDAO accountDetailDAO = new AccountDetailDAO();
        Cookie[] cookies = request.getCookies();
        String username = null;
        String password = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(REMEMBER_ME_COOKIE_USERNAME)) {
                    username = cookie.getValue();
                }
                if (cookie.getName().equals(REMEMBER_ME_COOKIE_PASSWORD)) {
                    password = cookie.getValue();
                }
            }
            Account account = accountDAO.authenticate(username, password);
            if (account != null) {
                session.setAttribute("accountCur", account);
                AccountDetail accountDetail = accountDetailDAO.getOne(account.getAccountId());
                session.setAttribute("accountDetail", accountDetail);
                response.sendRedirect("/PRJSHOPASM");
                return;
            }
        }

        request.getRequestDispatcher("sign-in.jsp").forward(request, response);
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
        AccountDAO accountDAO = new AccountDAO();
        AccountDetailDAO accountDetailDAO = new AccountDetailDAO();
        HttpSession session = request.getSession();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean isRemeberMe = request.getParameter("isRemeberMe") != null;
        Account account = accountDAO.authenticate(username, password);
        if (account == null) {
            request.setAttribute("msg", "Sign in Fail Username or pw wrong");
            request.getRequestDispatcher("sign-in.jsp").forward(request, response);
        } else {
            session.setAttribute("accountCur", account);
            AccountDetail accountDetail = accountDetailDAO.getOne(account.getAccountId());
            session.setAttribute("accountDetail", accountDetail);
            if (isRemeberMe) {
                Cookie cookieUsername = new Cookie(REMEMBER_ME_COOKIE_USERNAME, username);
                cookieUsername.setMaxAge(REMEMBER_ME_COOKIE_MAX_AGE);
                Cookie cookiePassword = new Cookie(REMEMBER_ME_COOKIE_PASSWORD, password);
                cookiePassword.setMaxAge(REMEMBER_ME_COOKIE_MAX_AGE);
                response.addCookie(cookieUsername);
                response.addCookie(cookiePassword);
            }
            response.sendRedirect("/PRJSHOPASM");
        }
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
