<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import = "java.util.*" %>

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
        <link rel="stylesheet" href="assets/css/common.css">
        <link rel="stylesheet" href="assets/css/profile.css">
    </head>

    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <body>
        <!--NAVIGATION-->
        <%@include file="component/nav.jsp" %>
        <!-- ---------- -->

        <nav>
            <div class="container emp-profile">

                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-img">
                            <img src="assets/img/logo1.png" alt=""/>
                            <div class="file btn btn-lg btn-primary">
                                Change Photo
                                <input type="file" name="file"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="profile-head">
                            <h5>
                                ${requestScope.accountDetail.nickName}
                            </h5>
                            <h6>
                                Phone Number: ${sessionScope.loginAccount.phoneNumber}
                            </h6>
                            <!--                            <p class="proile-rating">RANKINGS : <span>8/10</span></p>-->
                            <ul class="nav nav-tabs" id="myTab" role="tablist" style="margin-top: 50px">
                                <li class="nav-item">
                                    <a class="nav-link" id="home-tab" data-bs-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">About</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="address-tab" data-bs-toggle="tab" href="#address" role="tab" aria-controls="address" aria-selected="false">Address Contact</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <a class="profile-edit-btn" data-bs-toggle="modal" data-bs-target="#changeInformModal" href="javascript:void(0)">edit profile</a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <!--                        <div class="profile-work">
                                                    <p>WORK LINK</p>
                                                    <a href="">Website Link</a><br/>
                                                    <a href="">Bootsnipp Profile</a><br/>
                                                    <a href="">Bootply Profile</a>
                                                    <p>SKILLS</p>
                                                    <a href="">Web Designer</a><br/>
                                                    <a href="">Web Developer</a><br/>
                                                    <a href="">WordPress</a><br/>
                                                    <a href="">WooCommerce</a><br/>
                                                    <a href="">PHP, .Net</a><br/>
                                                </div>-->
                    </div>
                    <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">

                            <!----------------USER ACCOUNT------------->
                            <div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label><i class="fa-solid fa-phone icon"></i> Phone Number</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p>${sessionScope.loginAccount.phoneNumber}</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label><i class="fa-solid fa-signature icon"></i> Name</label>
                                    </div>
                                    <div class="col-md-4">
                                        <p>${requestScope.accountDetail.nickName}</p>
                                    </div>
                                    <div class="col-md-2">
                                        <p><i class="fa-regular fa-pen-to-square"></i></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label><i class="fa-solid fa-calendar-days icon"></i> Date Of Birth</label>
                                    </div>
                                    <div class="col-md-4">
                                        <p>${requestScope.accountDetail.dob}</p>
                                    </div>
                                    <div class="col-md-2">
                                        <p><i class="fa-regular fa-pen-to-square"></i></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label><i class="fa-solid fa-calendar-days icon"></i> Date Of Creation</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p>${requestScope.accountDetail.doc}</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label><i class="fa-solid fa-lock icon"></i> Pass Word</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p><a data-bs-toggle="modal" data-bs-target="#changePasswordModal" href="javascript:void(0)">Change</a></p>
                                    </div>
                                </div>
                            </div>
                            <!----------------END ACCOUNT------------->
                            <!----------------START ADDRESS------------->

                            <div class="tab-pane fade" id="address" role="tabpanel" aria-labelledby="address-tab">
                                <div class="row mb-5">
                                    <div class="col-md-3 fw-bold d-flex justify-content-center">
                                        Name Contact
                                    </div>
                                    <div class="col-md-3 fw-bold d-flex justify-content-center">
                                        Phone Contact
                                    </div>
                                    <div class="col-md-3 fw-bold d-flex justify-content-center">
                                        Address Contact
                                    </div>
                                </div>
                                <c:forEach items="${requestScope.lstAddressContact}" var="addressContact" varStatus="i">
                                    <form class="address-group shadow p-3 mb-4 bg-white rounded" method="post" action="addressEdit">                                        

                                        <!-- input -->
                                        <div class="row">
                                            <div class="col-md-3">
                                                <input type="text" name="nameContact" class="form-control" value="${addressContact.nameContact}">
                                            </div>
                                            <div class="col-md-3">
                                                <input type="text" name="phoneContact" class="form-control" value="${addressContact.phoneContact}" pattern="^[\w@_-]{8,30}$" title="Please enter real phone number">
                                            </div>
                                            <div class="col-md-6">
                                                <input type="text" name="address" class="form-control" value="${addressContact.address}">
                                            </div>
                                            <input type="hidden" name="id" value="${addressContact.id}">
                                        </div>
                                        <!-- btn -->    
                                        <div class="row mt-2">
                                            <div class="col-md-3">
                                                <c:if test="${addressContact.addressDefault}">
                                                    <a class="btn-grad btn-cus" style="padding: 6px 12px; text-transform: none"> <i class="fa-solid fa-address-book"></i> Address default</a>
                                                </c:if>
                                            </div>
                                            <div class="col-md-3"></div>
                                            <div class="col-md-6">
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <c:if test="${!addressContact.addressDefault}">
                                                            <input type="submit" name="type" value="Delete" class="btn btn-secondary btn-cus">
                                                        </c:if>
                                                    </div>
                                                    <div class="col-md-5">
                                                        <c:if test="${!addressContact.addressDefault}">
                                                            <input type="submit" name="type" value="Set Default" class="btn btn-secondary btn-cus">
                                                        </c:if>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <input type="submit" name="type" value="Edit" class="btn btn-secondary btn-cus"> 
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end form --> 
                                    </form>
                                </c:forEach>


                                <!-- Add more -->
                                <form class="address-group shadow p-3 mb-4 mt-5 bg-white rounded" method="post" action="addressEdit">                                        
                                    <!-- input -->
                                    <div class="row">
                                        <div class="col-md-3">
                                            <input type="text" name="nameContact" class="form-control" placeholder="New name contact" required="">
                                        </div>
                                        <div class="col-md-3">
                                            <input type="text" name="phoneContact" class="form-control" placeholder="New phone contact" required="" pattern="^[\w@_-]{8,30}$" title="Please enter real phone number">
                                        </div>
                                        <div class="col-md-6">
                                            <input type="text" name="address" class="form-control" placeholder="New address contact" required="">
                                        </div>
                                        <input type="hidden" name="id" value="${addressContact.id}">
                                    </div>
                                    <!-- btn -->    
                                    <div class="row mt-2">
                                        <div class="col-md-3"></div>
                                        <div class="col-md-6"></div>
                                        <div class="col-md-3"><input type="submit" name="type" value="ADD MORE" class="btn-grad btn-cus" style="padding: 6px 12px; text-transform: none; border: none"></div>
                                    </div>
                                    <!-- end form --> 
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>


            <%@include file="component/modal-change-password.jsp" %>
            <%@include file="component/modal-contact-us.jsp" %>
            <div id="changeInformModal" class="modal fade" role="dialog">
                <div class="modal-dialog"U>
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">
                                Change Information
                            </h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <form action="changeInf" method="post" id="reused_form" >
                                <div class="form-group mt-4">
                                    <label for="name"> Name:</label>
                                    <input type="text" class="form-control" id="name" name="nickName" placeholder="${requestScope.accountDetail.nickName}">
                                </div>
                                <div class="form-group mt-4">
                                    <label for="dob"> Date of Birth:</label>
                                    <input type="text" class="form-control" id="dob" name="dob" placeholder="${requestScope.accountDetail.dob}"
                                           pattern="^\d{4}[\-\/\s]?((((0[13578])|(1[02]))[\-\/\s]?(([0-2][0-9])|(3[01])))|(((0[469])|(11))[\-\/\s]?(([0-2][0-9])|(30)))|(02[\-\/\s]?[0-2][0-9]))$" 
                                           title="Enter a date in this format YYYY-MM-DD"/>

                                </div>

                                <button type="submit" class="btn-grad mt-3" id="btnChangeInf" style="width: 100%; border: none">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
    </body>
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/jquery.min.js"></script>
    <script>
        const message = '<%= session.getAttribute("message") %>';
        if (message !== 'null') {
            alert(message);
        }

        const messageEdited = '<%= session.getAttribute("messageEdited") %>';
        if (messageEdited === 'address edited') {
            $("#address-tab").addClass("active");
            $("#address").addClass("show active");
        } else {
            $("#home-tab").addClass("active");
            $("#home").addClass("show active");
        }
    </script>

    <%
        request.getSession().removeAttribute("message");
        request.getSession().removeAttribute("messageEdited");
    %>
</html>
