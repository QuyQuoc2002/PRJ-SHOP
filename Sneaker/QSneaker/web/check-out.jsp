<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import = "java.util.*" %>
<%@page import = "entity.Cart" %>
<%@page import = "entity.AddressContact" %>

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
        <link rel="stylesheet" href="assets/css/common.css">
        <link rel="stylesheet" href="assets/css/check-out.css">
        <!--login/register js css-->
        <script src="assets/js/login-register.js"></script>
        <link rel="stylesheet" href="assets/css/login-register.css">
    </head>

    <body>
        <section class="h-100 h-custom decor-banner">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12">
                        <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                            <div class="card-body p-0">
                                <div class="row g-0">
                                    <div class="col-lg-8">
                                        <div class="p-5">
                                            <div class="d-flex justify-content-between align-items-center mb-5">
                                                <h1 class="fw-bold mb-0 text-black">Items</h1>
                                                <!-- <h6 class="mb-0 text-muted">3 items</h6> -->
                                            </div>
                                            <c:forEach items="${sessionScope.listCart}" var="cart" varStatus="i">
                                                <hr class="my-4">

                                                <div class="row mb-4 d-flex justify-content-between align-items-center">
                                                    <div class="col-md-2 col-lg-2 col-xl-2">
                                                        <img
                                                            src="assets/img/ImgProduct/${cart.img}jpg"
                                                            class="img-fluid rounded-3" alt="1 high university">
                                                    </div>
                                                    <div class="col-md-3 col-lg-3 col-xl-3">
                                                        <h6 class="text-muted">Brand: ${cart.brand}</h6>
                                                        <h6 class="text-muted">Size: ${cart.sizeValue}</h6>
                                                        <h6 class="text-black product-name mb-0">${cart.name}</h6>
                                                    </div>
                                                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex justify-content-center">
                                                        <h6 class="mb-0">${cart.quantity}</h6>
                                                    </div>
                                                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                                        <h6 class="mb-0">${cart.unitPrice}<sup>đ</sup></h6>
                                                    </div>
                                                    
                                                </div>
                                            </c:forEach>


                                            <hr class="my-4">
                                            <c:if test = "${sessionScope.listCart.size() == 0}">
                                                <h3 class="fw-bold mb-5 mt-2 pt-1 d-flex justify-content-center">No Product in here! Please add more</h3>
                                            </c:if>

                                            <div class="pt-5">
                                                <h6 class="mb-0"><a href="cart" class="text-body"><i
                                                            class="fas fa-long-arrow-alt-left me-2"></i>Back to cart</a>
                                                </h6>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 bg-grey">
                                        <div class="p-5">
                                            <h3 class="fw-bold mb-5 mt-2 pt-1">Summary</h3>
                                            <hr class="my-4">

                                            <div class="d-flex justify-content-between mb-4">
                                                <h5 class="text-uppercase">items ${listCart.size()} </h5>
                                                <h5>${sessionScope.totalPrice}<sup>đ</sup></h5>
                                            </div>
                                            <div class="d-flex justify-content-between mb-4">
                                                <h5 class="text-uppercase mb-3">Shipping</h5>
                                                <h5>30000<sup>đ</sup></h5>
                                            </div>

                                            <hr class="my-4">

                                            <div class="d-flex justify-content-between mb-5">
                                                <h5 class="text-uppercase">Total price</h5>
                                                <h5>${sessionScope.totalPrice + 30000}<sup>đ</sup> </h5>
                                            </div>

                                            <hr class="my-4">
                                            <div class="mb-5">
                                                <h5>ADDRESS CONTACT</h5>
                                                ${requestScope.addressContact.nameContact} - ${requestScope.addressContact.phoneContact} - ${requestScope.addressContact.address}
                                            </div>

                                            <a href="order?idAC=${requestScope.addressContact.id}" class="btn-grad" style="width: 100%;">Order</a>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
