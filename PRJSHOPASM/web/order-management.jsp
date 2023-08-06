<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="assets/img/favicon.png">
        <title>
            Material Dashboard 2 by Creative Tim
        </title>
        <!--     Fonts and icons     -->
        <link rel="stylesheet" type="text/css"
              href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
        <!-- Nucleo Icons -->
        <link href="assets/css/nucleo-icons.css" rel="stylesheet" />
        <link href="assets/css/nucleo-svg.css" rel="stylesheet" />
        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
              integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- Material Icons -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
        <!-- CSS Files -->
        <link id="pagestyle" href="assets/css/material-dashboard.css?v=3.0.5" rel="stylesheet" />
        <link rel="stylesheet" href="assets/css/pagination.css">
        <!-- Nepcha Analytics (nepcha.com) -->
        <!-- Nepcha is a easy-to-use web analytics. No cookies and fully compliant with GDPR, CCPA and PECR. -->
        <script defer data-site="YOUR_DOMAIN_HERE" src="https://api.nepcha.com/js/nepcha-analytics.js"></script>
    </head>

    <body class="g-sidenav-show  bg-gray-200">
        <%@include file="component/sidebar-admin.jsp" %>
        <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
            <!-- Navbar -->
            <!-- End Navbar -->
            <div class="container-fluid py-3">
                <div class="row">
                    <div class="col-12">
                        <div class="card my-4">
                            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                                <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3 d-flex">
                                    <h6 class="text-white text-capitalize ps-3 m-0">Order Management</h6>
                                    <form action="order-management" method="get">
                                        <select class="ms-3" style="border: none;" name="orderStatusId" id="" onchange="this.form.submit()">
                                            <c:forEach items="${requestScope.lstOrderStatus}" var="os">
                                                <option <c:if test="${requestScope.orderStatusId eq os.orderStatusId}"> selected="" </c:if> value="${os.orderStatusId}">${os.orderStatusName}</option>
                                            </c:forEach>
                                        </select>
                                    </form>
                                </div>
                            </div>
                            <div class="card-body px-0 pb-2">
                                <div class="table-responsive p-0">
                                    <table class="table align-items-center mb-0">
                                        <thead>
                                            <tr>
                                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Account</th>
                                                <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Order
                                                    Date</th>
                                                    <c:if test="${requestScope.orderStatusId eq 2}">
                                                    <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Expected
                                                        Date</th>
                                                    </c:if>
                                                    <c:if test="${requestScope.orderStatusId eq 3}">
                                                    <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Done
                                                        Date</th>
                                                    </c:if>
                                                <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Name
                                                </th>
                                                <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Phone
                                                </th>
                                                <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">View
                                                </th>
                                                <c:if test="${requestScope.orderStatusId ne 3}">
                                                    <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Action</th>
                                                    </c:if>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.lstOrder}" var="o">
                                                <tr>
                                                    <td>
                                                        <div class="d-flex px-2 py-1">
                                                            <div class="d-flex flex-column justify-content-center">
                                                                <h6 class="mb-0 text-sm">${o.account.accountEmail}</h6>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="align-middle text-center text-sm">
                                                        <span class="text-secondary text-xs font-weight-bold">${o.orderCreateDate}</span>
                                                    </td>
                                                    <c:if test="${requestScope.orderStatusId eq 2}">
                                                        <td class="align-middle text-center text-sm">
                                                            <span class="text-secondary text-xs font-weight-bold">${o.orderExpectedDate}</span>
                                                        </td>
                                                    </c:if>
                                                    <c:if test="${requestScope.orderStatusId eq 3}">
                                                        <td class="align-middle text-center text-sm">
                                                            <span class="text-secondary text-xs font-weight-bold">${o.orderDoneDate}</span>
                                                        </td>
                                                    </c:if>
                                                    <td class="align-middle text-center">
                                                        <span class="text-secondary text-xs font-weight-bold">${o.orderNameContact}</span>
                                                    </td>
                                                    <td class="align-middle text-center">
                                                        <span class="text-secondary text-xs font-weight-bold">${o.orderPhoneContact}</span>
                                                    </td>
                                                    <td class="align-middle text-center">
                                                        <a data-bs-toggle="modal" data-bs-target="#modal-order-detail" href="javascript:void(0)" onclick="getAllOrderDetail(${o.orderId});"><i class="fa-solid fa-eye"></i></a>
                                                    </td>
                                                    <c:if test="${requestScope.orderStatusId eq 1}">
                                                        <td class="align-middle text-center">
                                                            <form action="order-management" method="post">
                                                                <input type="hidden" name="orderId" value="${o.orderId}">
                                                                <input type="hidden" name="orderStatusId" value="2">
                                                                <button class="btn bg-gradient-primary m-0">Ship</button>
                                                            </form>
                                                        </td>
                                                    </c:if>
                                                    <c:if test="${requestScope.orderStatusId eq 2}">
                                                        <td class="align-middle text-center">
                                                            <form action="order-management" method="post">
                                                                <input type="hidden" name="orderId" value="${o.orderId}">
                                                                <input type="hidden" name="orderStatusId" value="3">
                                                                <button class="btn bg-gradient-primary m-0">Done</button>
                                                            </form>
                                                        </td>
                                                    </c:if>
                                                </tr>

                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="pagination pagination-style-three m-t-20">
                    <a <c:if test="${requestScope.pageCur eq 1}"> style="pointer-events: none; color: gray" </c:if> href="order-management?orderStatusId=${requestScope.orderStatusId}&page=${requestScope.pageCur - 1}">Prev</a>
                    <c:forEach items="${requestScope.lstPage}" var="p">
                        <a href="order-management?orderStatusId=${requestScope.orderStatusId}&page=${p}" <c:if test="${requestScope.pageCur eq p}"> class="selected" </c:if>>${p}</a>
                    </c:forEach>
                    <a <c:if test="${requestScope.pageCur eq requestScope.totalPage}"> style="pointer-events: none; color: gray" </c:if> href="order-management?orderStatusId=${requestScope.orderStatusId}&page=${requestScope.pageCur + 1}">Next</a>
                    </div>
                </div>
            </main>
        <%@include file="modal/modal-order-detail.jsp" %>
        <!--   Core JS Files   -->
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>
        <script src="assets/js/plugins/perfect-scrollbar.min.js"></script>
        <script src="assets/js/plugins/smooth-scrollbar.min.js"></script>
        <script>
                                                            var win = navigator.platform.indexOf('Win') > -1;
                                                            if (win && document.querySelector('#sidenav-scrollbar')) {
                                                                var options = {
                                                                    damping: '0.5'
                                                                };
                                                                Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
                                                            }
        </script>
        <!-- Github buttons -->
        <script async defer src="https://buttons.github.io/buttons.js"></script>
        <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
        <script src="assets/js/material-dashboard.min.js?v=3.0.5"></script>
        <script>
                                                            function getAllOrderDetail(orderId) {
                                                                const request = new XMLHttpRequest();
                                                                request.open("GET", "api/orderDetail?orderId=" + orderId, true);
                                                                request.onload = function () {
                                                                    if (this.readyState === 4 && this.status === 200) {
                                                                        let lstOrderDetailHtml = '';
                                                                        const lstOrderDetail = JSON.parse(this.responseText);
                                                                        let sum = 0;
                                                                        for (let orderDetail of lstOrderDetail) {
                                                                            lstOrderDetailHtml += `
                            <div class="d-flex flex-row mb-4 pb-2">
                                <div class="flex-fill">
                                    <h5 class="bold"><a class="text-danger" href="product-detail?productId=` + orderDetail.productId + `">` + orderDetail.orderDetailProductName + `</a></h5>
                                    <p class="text-muted"> Qt: ` + orderDetail.orderDetailQuantity + ` item</p> 
                                    <p class="text-muted"> Size: ` + orderDetail.orderDetailSizeValue + `</p> 

                                    <h4 class="mb-3"><span class="small text-muted"> Unit Price: </span> ` + orderDetail.orderDetailPriceProduct + ` VND</h4>
                                </div>
                                <div>
                                    <img class="align-self-center img-fluid"
                                         src="` + orderDetail.orderDetailProductImg + `" width="250">
                                </div>
                            </div>
                            <hr>
                        `;
                                                                            sum = sum + orderDetail.orderDetailPriceProduct * orderDetail.orderDetailQuantity;
                                                                        }
                                                                        document.getElementById('modal-order-detail-body').innerHTML = lstOrderDetailHtml;
                                                                        document.querySelector('#modal-order-detail .modal-footer').innerHTML = '<h3>Total Money: ' + sum + 'VND</h3>';
                                                                    } else {
                                                                        console.log(2);
                                                                    }
                                                                };
                                                                request.send(null);
                                                                let myModal = new bootstrap.Modal(document.getElementById("modal-order-detail"), {});
                                                                document.onreadystatechange = function () {
                                                                    myModal.show();
                                                                };
                                                            }
        </script>
    </body>

</html>