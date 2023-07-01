<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import = "java.util.*" %>
<%@page import = "entity.ModelSneaker" %>
<%@page import = "entity.Brand" %>
<%@page import = "entity.Size" %>


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
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <!--FontAwesome-->
        <link rel="stylesheet" href="assets/font/fontawesome-free-6.2.0-web/css/all.css">
        <!--css file-->        
        <link rel="stylesheet" href="assets/css/shop.css">
        <link rel="stylesheet" href="assets/css/common.css">
        <!--login/register js css-->
        <script src="assets/js/login-register.js"></script>
        <link rel="stylesheet" href="assets/css/login-register.css">

    </head>

    <body>
        <%@include file="component/nav.jsp" %>

        <!-- PRODUCT -->

        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="sidebar">
                        <form class="d-flex pt-3 search" action="search" method="get">
                            <input class="form-control me-2" type="text" placeholder="Search" name="text">
                            <button class="btn btn-primary" type="submit"><i
                                    class="fa-solid fa-magnifying-glass text-white"></i></button>
                        </form>
                        <form action="sort" method="get" class="input">
                            <label for="sortBy"></label>
                            <select name="sortBy" id="sortBy" onchange="this.form.submit()">
                                <option value="none">Order by</option>
                                <option value="price ASC">Price ASC</option>
                                <option value="price DESC">Price DESC</option>
<!--                                <option value="rate ASC">Rate ASC</option>
                                <option value="rate DESC">Rate DESC</option>
                                <option value="buyed ASC">Buyed ASC</option>
                                <option value="buyed DESC">Buyed DESC</option>-->
                            </select>
                        </form>
                        <form action="filter" method="get">
                            <!-- Price bar -->
                            <div class="d-flex" style="margin-top: 40px">
                                <input style="margin-right: 8px" class="form-control " type="text" placeholder="From.." name="priceFrom">
                                <input style="margin-left: 8px" class="form-control" type="text" placeholder="To.." name="priceTo">

                            </div>
                            <!-- END Price bar -->
                            <select name="idSize" id="size">
                                <option value="null">Select Size</option>
                                <c:forEach items="${lstSize}" var="size" varStatus="i">
                                    <option value="${size.id}">${size.sizeValue}</option>
                                </c:forEach>
                            </select>
                            <div class="select-brand text-white">
                                <div style="margin-top: 12px; font-size: 30px" >Brand:</div>
                                <c:forEach items="${lstBrand}" var="brand" varStatus="i">
                                    <div class="form-check">
                                        <input type="radio" class="form-check-input" id="radio1" name="idBrand"
                                               value="${brand.id}">${brand.name}
                                        <label class="form-check-label" for="radio1"></label>
                                    </div>
                                </c:forEach>
                            </div>
                            <button class="btn-grad filter-btn mt-4" type="submit">Filter</button>
                        </form>
                    </div>
                </div>
                <div class="col-md-9">
                    <c:if test = "${flag == '1'}">
                        <div id="new-product" class="mt-5">
                            <div class="row">
                                <hr style="background: white" class="my-4"></hr>
                                <h1 class="text-center text-glow-tupple">New Product</h1>
                                <hr style="background: white" class="my-4"></hr>
                                <c:forEach items="${lstNewProduct}" var="modelSneaker" varStatus="i">
                                    <div class="col-md-4 mt-5 d-flex justify-content-center">
                                        <!--Add card-->
                                        <div class="card glow" style="width:270px">
                                            <img class="card-img-top"
                                                 src="assets/img/ImgProduct/${modelSneaker.img}jpg"
                                                 alt="Card image">
                                            <i class="fa-solid fa-heart"></i>
                                            <div class="card-body">
                                                <div class="rate">
                                                    <i class="fa-solid fa-star" style="line-height: 2;"></i>
                                                    <p style="font-size:20px; margin-bottom: 0;">(4.5)</p>
                                                </div>
                                                <h5 class="card-title">${modelSneaker.name}</h5>
                                                <div class="price" style="display: flex; position: relative;">
                                                    <p class="card-text mb-0" style="font-size: 22px; font-weight: 600;">${modelSneaker.price}
                                                    </p>
                                                    <a href="product-detail?id=${modelSneaker.id}" class="btn-grad">Buy Now</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <hr style="background: white; margin-top: 6em"></hr>
                    </c:if>
                    <div id="all-product" class="mt-5">
                        <div class="row">
                            <c:forEach items="${requestScope.lst}" var="modelSneaker" varStatus="i">
                                <div class="col-md-4 mt-5 d-flex justify-content-center">
                                    <!--Add card-->
                                    <div class="card" style="width:270px">
                                        <img class="card-img-top"
                                             src="assets/img/ImgProduct/${modelSneaker.img}jpg"
                                             alt="Card image">
                                        <i class="fa-solid fa-heart"></i>
                                        <div class="card-body">
                                            <div class="rate">
                                                <i class="fa-solid fa-star" style="line-height: 2;"></i>
                                                <p style="font-size:20px; margin-bottom: 0;">(4.5)</p>
                                            </div>
                                            <h5 class="card-title">${modelSneaker.name}</h5>
                                            <div class="price" style="display: flex; position: relative;">
                                                <p class="card-text mb-0" style="font-size: 22px; font-weight: 600;">${modelSneaker.price}<sup>đ</sup>
                                                </p>
                                                <a href="product-detail?id=${modelSneaker.id}" class="btn-grad">Buy Now</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <nav aria-label="Page navigation example" class="">
                        <ul class="pagination justify-content-center mt-5">
                            <c:forEach items="${requestScope.lsPage}" var="page">
                                <li class="page-item ${requestScope.page == page ? "active" : ""}">
                                    <a class="page-link" href="shop?page=${page}">${page}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <div style="margin-top: 200px"></div>
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
    </script>

    <%
        request.getSession().removeAttribute("message");
        request.getSession().removeAttribute("messageR");
    %>

</html>
