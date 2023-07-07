<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import = "java.util.*" %>
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
                    <a href="product-management" class="nav-item nav-link active"><i class="fa fa-th me-2"></i>Product</a>
                    <a href="order-management" class="nav-item nav-link "><i class="fa fa-keyboard me-2"></i>Order</a>
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

            <div class="container-fluid pt-4 px-4">
                <div class="bg-secondary text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">Modal Sneaker</h6>
                        <a class="" data-bs-toggle="modal" data-bs-target="#addModel" href="javascript:void(0)">Add One</a>
                        <a href="">Show All</a>
                    </div>
                    <form action="modelEdit" method="post" id="modelEdit"></form>
                    <div class="table-responsive">
                        <div class="table text-start align-middle table-bordered table-hover mb-0">
                            <div class="tr text-white">
                                <div class="td" scope="col">Image</div>
                                <div class="td" scope="col">Name</div>
                                <div class="td" scope="col">Brand</div>
                                <div class="td" scope="col">Price</div>
                                <div class="td" scope="col">Status</div>
                                <div class="td" scope="col">action</div>
                            </div>


                            <c:forEach items="${requestScope.lstModel}" var="model" varStatus="i">
                                <form class="tr" action="modelEdit" method="post" id="modelEdit">
                                    <div class="td" style="padding: 0;width: 5%"><img style="width: 50px; height: 50px" src="assets/img/ImgProduct/${model.img}png" alt="alt"/></div>
                                    <div class="td" style="width: 40%"><input class="bg-dark text-white w-100 font-monospace border-bottom" type="text" name="nameModel" value="${model.name}" ></div>
                                    <div class="td" style="width: 15%">
                                        <select class="bg-dark text-white w-100 font-monospace border-bottom" name="idBrand"  >
                                            <c:forEach items="${lstBrand}" var="brand" varStatus="i">
                                                <option <c:if test="${model.idBrand eq brand.id}">selected=""</c:if> value="${brand.id}">${brand.name}</option>
                                            </c:forEach>
                                        </select>   
                                    </div>
                                    <div class="td" style="width: 15%"><input class="bg-dark text-white w-100 font-monospace border-bottom" type="number" name="price" value="${model.price}" ></div>
                                    <div class="td" style="width: 15%">
                                        <select class="bg-dark text-white w-100 font-monospace border-bottom" name="idStatusModel" >
                                            <c:forEach items="${requestScope.lstStatusModel}" var="status" varStatus="i">
                                                <option <c:if test="${model.idStatus eq status.value}">selected=""</c:if> value="${status.value}">${status.name} </option>
                                            </c:forEach>
                                        </select> 
                                    </div>
                                    <input type="hidden" name="idModel" value="${model.id}">
                                    <div class="td" style="width: 15%">
                                        <input type="submit" class="btn btn-sm btn-primary" name="type" value="Delete">
                                        <input type="submit" class="btn btn-sm btn-primary" name="type" value="Edit">
                                    </div>
                                </form>
                            </c:forEach>


                        </div>
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



    <div id="addModel" class="modal fade" role="dialog">
        <div class="modal-dialog"U>
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title text-dark">
                        Add Model
                    </h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form action="modelEdit" method="post" id="reused_form" >
                        <div class="form-group mt-4">
                            <label for="img"> IMG URL:</label>
                            <input type="text" class="form-control bg-white" id="img" name="img" placeholder="IMG URL" required="">
                        </div>
                        <div class="form-group mt-4">
                            <label for="name"> Name:</label>
                            <input type="text" class="form-control bg-white" id="name" name="name" placeholder="Name" required="">
                        </div>
                        <div class="form-group mt-4">
                            <label for="idBrand"> Brand:</label>
                            <select class="form-control bg-white" name="idBrand">
                                <c:forEach items="${lstBrand}" var="brand" varStatus="i">
                                    <option value="${brand.id}">${brand.name}</option>
                                </c:forEach>
                            </select>   
                        </div>
                        <div class="form-group mt-4">
                            <label for="price"> Price</label>
                            <input type="number" class="form-control bg-white" id="price" name="price" placeholder="Price" required="">
                        </div>
                        <div class="form-group mt-4">
                            <label for="idStatus"> Status:</label>
                            <select class="form-control bg-white" name="idStatusModel" >
                                <c:forEach items="${requestScope.lstStatusModel}" var="status" varStatus="i">
                                    <option value="${status.value}">${status.name} </option>
                                </c:forEach>
                            </select>  
                        </div>

                        <input type="submit" name="type" value="Add More" class="btn-grad mt-3" style="width: 100%; border: none">
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="assets/js/bootstrap.js"></script>
<script src="assets/js/jquery.min.js"></script>
</html>