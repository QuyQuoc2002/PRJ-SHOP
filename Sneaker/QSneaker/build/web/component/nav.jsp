<%-- 
    Document   : nav
    Created on : Oct 8, 2022, 12:08:18 PM
    Author     : DELL
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm navbar-dark mt-3">
    <div class="container-fluid">
        <a class="navbar-brand" href="/QSneaker"><img class="logo" src="assets/img/logo1.png" alt=""></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mynavbar">
            <ul class="navbar-nav me-auto">
                <c:forEach items="${lstBrand}" var="brand" varStatus="i">
                    <li class="nav-item" style="z-index: 3">
                        <a class="nav-link text-white" href="/QSneaker/filter?priceFrom=&priceTo=&idSize=null&idBrand=${brand.id}">${brand.name}</a>
                    </li>
                </c:forEach>
                <li class="nav-item" style="z-index: 3">
                    <a class="nav-link text-white" href="/QSneaker/shop">Shop</a>
                </li>
                <li class="nav-item search-icon">
                    <a class="nav-link text-white" href="javascript:void(0)"><i
                            class="fa-solid fa-magnifying-glass text-white"></i></a>
                </li>
                <li class="nav-item cart-icon">
                    <c:choose>
                        <c:when test="${sessionScope.loginAccount != null}">
                            <a class="nav-link text-white" href="cart"><i class="fa-solid fa-cart-shopping text-white"></i></a>
                        </c:when>
                        <c:otherwise>
                            <a class="nav-link text-white" data-toggle="modal" href="javascript:void(0)" onclick="openLoginModal();"><i class="fa-solid fa-cart-shopping text-white"></i></a>
                        </c:otherwise>
                    </c:choose>
                </li>
                <li class="nav-item user-icon">
                    <div class="dropdown">
                        <a class="nav-link text-white dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fa-solid fa-user text-white"></i></a>
                        </a>

                        <ul class="dropdown-menu">
                            <c:if test="${sessionScope.loginAccount != null}">
                                <li><a class="dropdown-item" href="profile"><i class="fa-solid fa-user"></i>${loginAccount.phoneNumber}</a></li>
                                <div class="dropdown-divider text-white"></div>
                            </c:if>
                            <c:if test="${sessionScope.loginAccount == null}">
                                <li><a class="dropdown-item" data-toggle="modal" href="javascript:void(0)" onclick="openLoginModal();"><i class="fa-solid fa-right-to-bracket"></i>Login</a></li>
                                <div class="dropdown-divider text-white"></div>
                                <li><a class="dropdown-item" data-toggle="modal" href="javascript:void(0)" onclick="openRegisterModal();"><i class="fa-solid fa-user-plus"></i>Register</a></li>
                                </c:if>
                                <c:if test="${sessionScope.loginAccount != null}">
                                <form action="logout" method="post">
                                    <input type="hidden" name="myHrefLogout" id="myHrefLogout" value="" />
                                    <script>document.getElementById('myHrefLogout').value = location.href;</script>
                                    <li><button class="dropdown-item" type="submit"><i class="fa-solid fa-right-to-bracket"></i>Logout</button></li>
                                </form>
                            </c:if>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
        <a class="btn-grad" data-bs-toggle="modal" data-bs-target="#contactUsModal" href="javascript:void(0)">Contact Us</a>
    </div>
</nav>



