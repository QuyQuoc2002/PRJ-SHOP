<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="shortcut icon" href="assets/img/logo1.png" type="image/x-icon" />
        <title>QSneaker</title>

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
            rel="stylesheet"
            />
        <!--Bootstrap-->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
            />
        <!--FontAwesome-->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
            integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <!--css file-->
        <link rel="stylesheet" href="assets/css/profile.css" />
        <link href="assets/css/style.css" rel="stylesheet" />
    </head>

    <body>
        <%@include file="component/header-shop.jsp" %>
        <!-- Topbar End -->
        <div class="container emp-profile">
            <div class="row">
                <div class="col-md-3">
                    <div class="profile-img">
                        <img src="assets/img/bg-smart-home-2.jpg" alt="" />
                        <div class="file btn btn-lg btn-primary">
                            Change Photo
                            <input type="file" name="file" />
                        </div>
                    </div>
                </div>
                <div class="row col-md-9">
                    <div class="col-md-9">
                        <div class="profile-head">
                            <h5>${sessionScope.accountDetail.accountDetailName}</h5>
                            <h6>Email: ${sessionScope.accountCur.accountEmail}</h6>
                            <!--                            <p class="proile-rating">RANKINGS : <span>8/10</span></p>-->
                        </div>
                    </div>
                    <div class="col-md-3">
                        <a
                            class="profile-edit-btn"
                            data-toggle="modal"
                            data-target="#changeInformModal"
                            href="javascript:void(0)"
                            >edit profile</a
                        >
                    </div>
                    <div class="col-md-12" style="margin-top: -50px;">
                        <ul
                            class="nav nav-tabs"
                            id="myTab"
                            role="tablist"
                            style="margin-top: 50px"
                            >
                            <li class="nav-item">
                                <a
                                    class="nav-link"
                                    id="home-tab"
                                    data-toggle="tab"
                                    href="#home"
                                    role="tab"
                                    aria-controls="home"
                                    aria-selected="true"
                                    >About</a
                                >
                            </li>
                            <li class="nav-item">
                                <a
                                    class="nav-link"
                                    id="address-tab"
                                    data-toggle="tab"
                                    href="#address"
                                    role="tab"
                                    aria-controls="address"
                                    aria-selected="false"
                                    >Address Contact</a
                                >
                            </li>
                            <li class="nav-item">
                                <a
                                    class="nav-link"
                                    id="delivering-tab"
                                    data-toggle="tab"
                                    href="#delivering"
                                    role="tab"
                                    aria-controls="delivering"
                                    aria-selected="false"
                                    >Delivering</a
                                >
                            </li>
                            <li class="nav-item">
                                <a
                                    class="nav-link"
                                    id="done-order-tab"
                                    data-toggle="tab"
                                    href="#done-order"
                                    role="tab"
                                    aria-controls="done-order"
                                    aria-selected="false"
                                    >Done Order</a
                                >
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                </div>
                <div class="col-md-9">
                    <div class="tab-content profile-tab" id="myTabContent">
                        <!----------------Start About------------->
                        <%@include file="tab/profile/tab-about.jsp" %>
                        <!----------------START ADDRESS------------->
                        <%@include file="tab/profile/tab-address.jsp" %>
                        <!------------------delivering----------------------->
                        <%@include file="tab/profile/tab-delivering.jsp" %>
                        <!------------------Order Done----------------------->
                        <%@include file="tab/profile/tab-done-order.jsp" %>
                        
                    </div>
                </div>
            </div>
        </div>

        <!------------------------MODAL CHANGE PASSWORD-------------------------->
        <%@include file="modal/profile/modal-change-password.jsp" %>

        <!------------------------MODAL CHANGE INFORMATION-------------------------->
        <%@include file="modal/profile/modal-change-infomation.jsp" %>

        <!-------------------------------MODAL ORDER DETAIL------------------------------------->
        <%@include file="modal/profile/modal-order-detail.jsp" %>

    </body>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script>
        $("#home-tab").addClass("active");
        $("#home").addClass("show active");
    </script>
    <script>
      const addressTab = '<%= session.getAttribute("addressTab") %>';
      if (addressTab !== 'null') {
        $("#home-tab").removeClass("active");
        $("#home").removeClass("show active");
        $("#address-tab").addClass("active");
        $("#address").addClass("show active");
      }
    </script>
    <script>
      const message = '<%= session.getAttribute("msg") %>';
      if (message !== 'null') {
        var myModal = new bootstrap.Modal(document.getElementById("changePasswordModal"), {});
        document.onreadystatechange = function () {
            myModal.show();
        };
      }
    </script>
    <%
        request.getSession().removeAttribute("msg");
        request.getSession().removeAttribute("addressTab");
    %>
</html>
