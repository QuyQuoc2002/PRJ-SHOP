<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import = "java.util.*" %>
<%@page import = "entity.Cart" %>

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
        <link rel="stylesheet" href="assets/css/cart.css">
    </head>

    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                                                <h1 class="fw-bold mb-0 text-black">Shopping Cart</h1>
                                                <h6 class="mb-0 text-muted">${listCart.size()} items</h6>
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
                                                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
<!--                                                        <button class="btn btn-link px-2"
                                                                onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                            <i class="fas fa-minus"></i>
                                                        </button>-->

<!--                                                        <input id="form1" min="0" name="quantity" value="${cart.quantity}" type="number"
                                                               class="form-control form-control-sm" />-->
                                                        <div class="d-flex justify-content-center"> ${cart.quantity} </div>
<!--                                                        <button class="btn btn-link px-2"
                                                                onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                            <i class="fas fa-plus"></i>-->
                                                        </button>
                                                    </div>
                                                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                                        <h6 class="mb-0">${cart.unitPrice}<sup>đ</sup></h6>
                                                    </div>
                                                    <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                                        <a href="removecart?i=${i.index}" class="text-muted"><i class="fas fa-times"></i></a>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                            <hr class="my-4">
                                            <c:if test = "${sessionScope.listCart.size() == 0}">
                                                <h3 class="fw-bold mb-5 mt-2 pt-1 d-flex justify-content-center">No Product in here! Please add more</h3>
                                            </c:if>
                                            <div class="pt-5">
                                                <h6 class="mb-0"><a href="shop" class="text-body"><i
                                                            class="fas fa-long-arrow-alt-left me-2"></i>Back to shop</a></h6>
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
                                                <c:choose>
                                                    <c:when test="${sessionScope.listCart.size() == 0}">
                                                        <h5>0<sup>đ</sup></h5>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <h5>30000<sup>đ</sup></h5>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>                                       
                                            <hr class="my-4">
                                            <div class="d-flex justify-content-between mb-5">
                                                <h5 class="text-uppercase">Total price</h5>
                                                <c:choose>
                                                    <c:when test="${sessionScope.listCart.size() == 0}">
                                                        <h5>0<sup>đ</sup></h5>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <h5>${sessionScope.totalPrice + 30000}<sup>đ</sup> </h5>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:forEach items="${lstSize}" var="size" varStatus="i">
                                                    <option value="${size.id}">${size.sizeValue}</option>
                                                </c:forEach>
                                                </select>
                                            </div>    
                                            <form action="check-out" method="post">
                                                <hr class="my-4">
                                                <h5 class="text-uppercase mb-3">Address Contact</h5>
                                                <div class="mb-5">
                                                    <div class="form-outline">
                                                        <Select name="addressContact" id="" class="form-controller form-control-lg" style="width: 100%">
                                                            <c:forEach items="${lstAddressContact}" var="ac" varStatus="i">
                                                                <option <c:if test="${ac.addressDefault}"> selected </c:if> value="${ac.id}">${ac.nameContact} - ${ac.phoneContact} - ${ac.address}</option>
                                                            </c:forEach>
                                                        </Select>
                                                    </div>
                                                </div>
                                                <c:choose>
                                                    <c:when test="${sessionScope.listCart.size() == 0}">
                                                        <a href="cart" class="btn-grad">Check Out</a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="submit" class="btn-grad" value="Check Out" style="border: none; width: 100%">
                                                    </c:otherwise>
                                                </c:choose> 
                                            </form>
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
