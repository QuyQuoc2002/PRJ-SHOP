<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>MultiShop - Online Shop Website Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="assets/img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="assets/lib/animate/animate.min.css" rel="stylesheet">
        <link href="assets/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="assets/css/style.css" rel="stylesheet">
    </head>

    <body>
        <!-- Topbar Start -->
        <%@include file="component/header-shop.jsp" %>
        <!-- Topbar End -->


        <!-- Navbar Start -->    
        <%@include file="component/category-shop.jsp" %>
        <!-- Navbar End -->


        <!-- Breadcrumb Start -->
        <div class="container-fluid">
            <div class="row px-xl-5">
                <div class="col-12">
                    <nav class="breadcrumb bg-light mb-30">
                        <a class="breadcrumb-item text-dark" href="#">Home</a>
                        <a class="breadcrumb-item text-dark" href="#">Shop</a>
                        <span class="breadcrumb-item active">Shop List</span>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->


        <!-- Shop Start -->
        <div class="container-fluid">
            <div class="row px-xl-5">
                <!-- Shop Sidebar Start -->
                <div class="col-lg-3 col-md-4">
                    <form method="get" action="shop">
                        <!-- Price Start -->
                        <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Filter by price</span></h5>
                        <div class="bg-light p-4 mb-30">
                            <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                <input name="price" type="checkbox" class="custom-control-input" id="price-1">
                                <label class="custom-control-label" for="price-1">0 - 100.000</label>
                            </div>
                            <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                <input name="price" type="checkbox" class="custom-control-input" id="price-2">
                                <label class="custom-control-label" for="price-2">100.000 - 200.000</label>
                            </div>
                            <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                <input name="price" type="checkbox" class="custom-control-input" id="price-3">
                                <label class="custom-control-label" for="price-3">200.000 - 300.000</label>
                            </div>
                            <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                <input name="price" type="checkbox" class="custom-control-input" id="price-4">
                                <label class="custom-control-label" for="price-4">300.000 - 400.000</label>
                            </div>
                            <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                                <input name="price" type="checkbox" class="custom-control-input" id="price-5">
                                <label class="custom-control-label" for="price-5">400.000 - 500.000</label>
                            </div>
                        </div>
                        <!-- Price End -->

                        <!-- Size Start -->
                        <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Filter by size</span></h5>
                        <div class="bg-light p-4 mb-30">
                            <c:forEach items="${requestScope.lstSize}" var="s">
                                <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                    <input name="sizeId" value="${s.sizeId}" type="checkbox" class="custom-control-input" id="size${s.sizeId}">
                                    <label class="custom-control-label" for="size${s.sizeId}">${s.sizeValue}</label>
                                </div>
                            </c:forEach>
                        </div>
                        <!-- Size End -->
                        <button type="submit" class="btn btn-primary px-5 w-100"><i class="fa fa-filter mr-1"></i> Filter</button>
                    </form>
                </div>
                <!-- Shop Sidebar End -->


                <!-- Shop Product Start -->
                <div class="col-lg-9 col-md-8">
                    <div class="row pb-3">
                        <div class="col-12 pb-1">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <div class="">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">Sorting</button>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="#">Latest</a>
                                            <a class="dropdown-item" href="#">Popularity</a>
                                            <a class="dropdown-item" href="#">Best Rating</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <c:forEach items="${requestScope.lstProduct}" var="p">
                            <div class="col-lg-4 col-md-6 col-sm-6 pb-1">
                                <div class="product-item bg-light mb-4">
                                    <div class="product-img position-relative overflow-hidden">
                                        <img class="img-fluid w-100" src="${p.productImg}" alt="">
                                        <a href="product-detail.html">
                                            <div class="product-action">
                                            </div>
                                        </a>
                                    </div>
                                    <div class="text-center py-4">
                                        <a class="h6 text-decoration-none" href="">${p.productName}</a>
                                        <div class="d-flex align-items-center justify-content-center mt-2">
                                            <h5>${p.productPrice}</h5>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-center mb-1">
                                            <small class="fa fa-star text-primary mr-1"></small>
                                            <small class="fa fa-star text-primary mr-1"></small>
                                            <small class="fa fa-star text-primary mr-1"></small>
                                            <small class="fa fa-star text-primary mr-1"></small>
                                            <small class="fa fa-star text-primary mr-1"></small>
                                            <small>(99)</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="col-12">
                            <nav>
                                <ul class="pagination justify-content-center">  
                                    <li class="page-item <c:if test="${requestScope.pageCur eq 1}">disabled</c:if> "><a class="page-link" href="${requestScope.href}page=${requestScope.pageCur - 1}">Previous</span></a></li>
                                        <c:forEach items="${requestScope.lstPage}" var="p">
                                        <li class="page-item <c:if test="${requestScope.pageCur eq p}">active</c:if> "><a class="page-link" href="${requestScope.href}page=${p}">${p}</a></li>
                                        </c:forEach>
                                    <li class="page-item <c:if test="${requestScope.pageCur eq requestScope.totalPage}">disabled</c:if>"><a class="page-link" href="${requestScope.href}page=${requestScope.pageCur + 1}">Next</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <!-- Shop Product End -->
                </div>
            </div>
            <!-- Shop End -->


            <!-- Footer Start -->
        <%@include file="component/footer-shop.jsp" %>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="assets/lib/easing/easing.min.js"></script>
        <script src="assets/lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="assets/mail/jqBootstrapValidation.min.js"></script>
        <script src="assets/mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="assets/js/main.js"></script>
    </body>

</html>