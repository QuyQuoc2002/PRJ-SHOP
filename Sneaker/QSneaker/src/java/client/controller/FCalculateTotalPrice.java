package client.controller;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import entity.Cart;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Shado
 */
@WebFilter(filterName = "CalculateTotalPrice", urlPatterns = {"/cart"})
public class FCalculateTotalPrice implements Filter {

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        HttpSession session = req.getSession();
        List<Cart> listOrder = null;
        listOrder = (ArrayList<Cart>) session.getAttribute("listCart");

        long totalPrice = 0;
        if (listOrder == null) {
            totalPrice = 0;
        } else {
            for (Cart c : listOrder) {
                int temp = c.getQuantity() * c.getUnitPrice();
                totalPrice += temp;
            }
        }
        session.setAttribute("totalPrice", totalPrice);
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }

    @Override
    public void init(FilterConfig filterConfig) {
    }

}
