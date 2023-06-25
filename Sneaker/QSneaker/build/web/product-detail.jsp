<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import = "java.util.*" %>
<%@page import = "entity.ModelSneaker" %>
<%@page import = "entity.Size" %>
<%@page import = "entity.Brand" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="assets/img/logo1.png" type="image/x-icon">
        <title>QSneaker</title>
        <!--Bootstrap-->
        <link rel="stylesheet" href="assets/css/bootstrap.css">
        <!--FontAwesome-->
        <link rel="stylesheet" href="assets/font/fontawesome-free-6.2.0-web/css/all.css">
        <!--css file-->
        <link rel="stylesheet" href="assets/css/product-detail.css">
        <link rel="stylesheet" href="assets/css/common.css">
        <!--login/register js css-->
        <script src="assets/js/login-register.js"></script>
        <link rel="stylesheet" href="assets/css/login-register.css">
    </head>

    <body>
        <div class="lens-center-red lens-red-1"></div>
        <div class="lens-center-blue lens-blue-1"></div>
        <div class="sub full">MULTI_<br>COLOR</div>
        <div class="sub stroke">MULTI_COLOR</div>
        <a class="sub back-page-btn" onclick="history.back()">
            <i class="fa-solid fa-arrow-left"></i>
        </a>

        <!--NAVIGATION-->
        <%@include file="component/nav.jsp" %>

        <!-- ---------- -->
        <div class="container-fluid sup">
            <img class="product sub" src="assets/img/ImgProduct/${modelSneaker.img}png" alt="">
            <img class="product-decor sub" src="assets/img/ImgProduct/${modelSneaker.img}png" alt="">
            <div class="row">
                <div class="col-md-8 text-white product-script" style="padding-left: 200px;">
                    <p style="opacity: 0.6;">Brand: ${brand.name.toUpperCase()}</p>
                    <p style="font-weight: 700;">${modelSneaker.name}</p>
                    <p>${modelSneaker.price}<sup>đ</sup></p>

                    <div class="row">
                        <form action="addtocart" method="post" class="input">
                            <input type="hidden" name="idModelSneaker" value="${modelSneaker.id}">
                            <label for="size-quan"></label>
                            <select name="size" id="size">
                                <option value="none" >Select Size</option>
                                <c:forEach items="${lstSize}" var="size" varStatus="i">
                                    <option value="${size.id}">${size.sizeValue}</option>
                                </c:forEach>
                            </select>        

                            <input id="quantity" min="1" name="quantity" value="1" type="number"
                                   class="form-control form-control-sm" style="width: 60px; display: inline" />

                            <!-- <br><br>
                          <input type="submit" value="Submit"> -->
                            <button type="submit" class="btn-grad" style="border-radius: 0; z-index: 200; border: none">Add To cart</button>
                        </form>
                    </div>



                </div>
                <div class="col-md-4" style="padding: 0;">
                    <div class="decor-banner"></div>
                </div>
            </div>
        </div>
        <%@include file="component/footer.jsp" %>
        <%@include file="component/modal-login.jsp" %>
        <%@include file="component/modal-contact-us.jsp" %>
    </body>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/register-validate.js"></script>
    <script>
            const message = '<%= session.getAttribute("message") %>';
            if (message !== 'null') {
                const myModal = new bootstrap.Modal(document.getElementById('loginModal'));
                openLoginModal();
            }
            const messageR = '<%= session.getAttribute("messageR") %>';
            if (messageR === 'Regist successful') {
                alert(messageR);
            } else if (messageR !== 'null') {
                openRegisterModal();
            }
            
            const messageAddToCart = '<%= session.getAttribute("messageAddToCart") %>';
            if(messageAddToCart !== 'null')
            alert(messageAddToCart);
    </script>

    <%
        request.getSession().removeAttribute("message");
        request.getSession().removeAttribute("messageR");
        request.getSession().removeAttribute("messageAddToCart");
    %>
</html>
