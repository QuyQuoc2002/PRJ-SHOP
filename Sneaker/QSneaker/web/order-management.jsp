<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import = "java.util.*" %>
<%@page import = "entity.OrderDetail" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--<html lang="en">-->

<head>
    <meta charset="UTF-8">
    <title>DashBoard</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="assets/img/logo1.png" rel="icon">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <!--<link href="assets/css/bootstrap.css" rel="stylesheet">-->
    <link href="assets/css/common.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="assets/css/dashboard.css" rel="stylesheet">

</head>

<body>
    <style type="text/css">
        p{
            margin-bottom: 2px;
        }
        .table
        {
            display:table;
        }
        .tr
        {
            display:table-row;
        }
        .td
        {
            display:table-cell;
        }
    </style>
    <div class="container-fluid position-relative d-flex p-0">

        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-secondary navbar-dark">
                <a href="dashboard" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary"><i class="fa fa-user-edit me-2"></i>QSneaker</h3>
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <img class="rounded-circle" src="assets/img/logo1.png" alt="" style="width: 40px; height: 40px;">
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </div>
                    <div class="ms-3">
                        <h6 class="mb-0">Quy Quoc</h6>
                        <span>Admin</span>
                    </div>
                </div>
                <div class="navbar-nav w-100">
                    <a href="dashboard" class="nav-item nav-link"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
<!--                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Elements</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="button.html" class="dropdown-item">Buttons</a>
                            <a href="typography.html" class="dropdown-item">Typography</a>
                            <a href="element.html" class="dropdown-item">Other Elements</a>
                        </div>
                    </div>-->
                    <a href="product-management" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Product</a>
                    <a href="order-management" class="nav-item nav-link active"><i class="fa fa-keyboard me-2"></i>Order</a>
                    <!--<a href="#" class="nav-item nav-link"><i class="fa fa-user me-2"></i>User</a>-->
                    <a href="logout" class="nav-item nav-link"><i class="fa fa-user-alt me-2"></i>Logout</a><!--
                    <a href="chart.html" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>Charts</a>-->
<!--                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Pages</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="signin.html" class="dropdown-item">Sign In</a>
                            <a href="signup.html" class="dropdown-item">Sign Up</a>
                            <a href="404.html" class="dropdown-item">404 Error</a>
                            <a href="blank.html" class="dropdown-item">Blank Page</a>
                        </div>
                    </div>-->
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->


        <!-- Content Start -->
        <div class="content">
            <!-- Sale & Revenue Start -->
            <!-- Sale & Revenue End -->


            <!-- Sales Chart Start -->
            <!-- Sales Chart End -->


            <!-- Recent Sales Start -->
            <!-- New -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-secondary text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">New Order</h6>
                        <a href="">Show All</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                                <tr class="text-white">
                                    <th scope="col">Stt</th>
                                    <th scope="col">Oder date</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Phone</th>
                                    <th scope="col">Address</th>
                                    <th scope="col">Total</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.lstNewOrder}" var="order" varStatus="i">
                                    <tr>
                                        <td>${i.index + 1}</td>
                                        <td>${order.orderDate}</td>
                                        <td>${order.nameContact}</td>
                                        <td>${order.phoneContact}</td>
                                        <td>${order.address}</td>                                   
                                        <td>${order.total}</td>
                                        <td style="display: flex">
                                            <form action="statusOrderChanging" method="post">
                                                <input type="hidden" name="idOrder" value="${order.id}">
                                                <input type="submit" name="type" value="Confirm" class="btn btn-sm btn-primary">
                                            </form>
                                            <form style="margin-left: 5px" action="orderDetail" method="post">
                                                <input type="hidden" name="idOrder" value="${order.id}">
                                                <input type="submit" name="type" value="Detail" class="btn btn-sm btn-primary">
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Shipping -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-secondary text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">Shipping Order</h6>
                        <a href="">Show All</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                                <tr class="text-white">
                                    <th scope="col">Stt</th>
                                    <th scope="col">Oder date</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Phone</th>
                                    <th scope="col">Address</th>
                                    <th scope="col">Total</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.lstShippingOrder}" var="order" varStatus="i">
                                    <tr>
                                        <td>${i.index + 1}</td>
                                        <td>${order.orderDate}</td>
                                        <td>${order.nameContact}</td>
                                        <td>${order.phoneContact}</td>
                                        <td>${order.address}</td>                                   
                                        <td>${order.total}</td>
                                        <td style="display: flex">
                                            <form action="statusOrderChanging" method="post">
                                                <input type="hidden" name="idOrder" value="${order.id}">
                                                <input type="submit" name="type" value="Done" class="btn btn-sm btn-primary">
                                            </form>
                                            <form style="margin-left: 5px" action="orderDetail" method="post">
                                                <input type="hidden" name="idOrder" value="${order.id}">
                                                <input type="submit" name="type" value="Detail" class="btn btn-sm btn-primary">
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>    
            <!-- Done -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-secondary text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">Done Order</h6>
                        <a href="">Show All</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                                <tr class="text-white">
                                    <th scope="col">Stt</th>
                                    <th scope="col">Oder date</th>
                                    <th scope="col">Done date</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Phone</th>
                                    <th scope="col">Address</th>
                                    <th scope="col">Total</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.lstDoneOrder}" var="order" varStatus="i">
                                    <tr>
                                        <td>${i.index + 1}</td>
                                        <td>${order.orderDate}</td>
                                        <td>${order.doneDate}</td>
                                        <td>${order.nameContact}</td>
                                        <td>${order.phoneContact}</td>
                                        <td>${order.address}</td>                                   
                                        <td>${order.total}</td>
                                        <td style="display: flex">
                                            <form style="margin-left: 5px" action="orderDetail" method="post">
                                                <input type="hidden" name="idOrder" value="${order.id}">
                                                <input type="submit" name="type" value="Detail" class="btn btn-sm btn-primary">
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>      
            <!-- Recent Sales End -->


            <!-- Widgets Start -->
            <!-- Footer Start -->
<div class="container-fluid pt-4 px-4">
                <div class="bg-secondary rounded-top p-4">
                    <div class="row">
                        <div class="col-12 col-sm-6 text-center text-sm-start">
                            &copy; <a href="#">QSneaker</a>
                        </div>
                        <div class="col-12 col-sm-6 text-center text-sm-end">
                            <!--/*** This template is free as long as you keep the footer authorâs credit link/attribution link/backlink. If you'd like to use the template without the footer authorâs credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
<!--                            Designed By <a href="https://htmlcodex.com">HTML Codex</a>
                            <br>Distributed By: <a href="https://themewagon.com" target="_blank">ThemeWagon</a>-->
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer End -->
        </div>
        <!-- Content End -->
    </div>


    <!-- Detail -->
    <div id="OrderDetail" class="modal fade" role="dialog">
        <div class="modal-dialog"U>
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title text-dark">
                        Detail
                    </h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <c:forEach items="${sessionScope.lstOrderDetail}" var="orderDetail" varStatus="i">
                        
                        <div class="row mt-3">
                            <div class="col-md-4">
                                <c:forEach items="${sessionScope.lstProduct}" var="product" varStatus="i">
                                    <c:if test="${product.id eq orderDetail.idProduct}">
                                        <img src="assets/img/ImgProduct/${product.img}png" width="100%" height="100%" style="border-radius: 4px " alt="alt"/>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <div class="col-md-8">
                                <p>Name: ${orderDetail.nameProduct}</p>
                                <p>Size: ${orderDetail.size}</p>
                                <p>Quantity: ${orderDetail.quantity}</p>
                                <p>Total: ${orderDetail.total}<sup>d</sup></p>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="modal-footer">
                        <div class="font-monospace text-dark" style="font-size: 30px">${order.total}<sup>d</sup></div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/jquery.min.js"></script>
    <script>
    const idOrder = '<%= session.getAttribute("idOrder") %>';
    if (idOrder !== 'null') {
        var myModal = new bootstrap.Modal(document.getElementById("OrderDetail"), {});
        document.onreadystatechange = function () {
            myModal.show();
        };
    }
    </script>
    
    <%
        request.getSession().removeAttribute("lstOrderDetail");
        request.getSession().removeAttribute("idOrder");
        request.getSession().removeAttribute("order");
        request.getSession().removeAttribute("lstProduct");
    %>
</html>