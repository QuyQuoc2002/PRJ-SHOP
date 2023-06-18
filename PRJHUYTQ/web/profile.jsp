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
                            data-bs-toggle="modal"
                            data-bs-target="#changeInformModal"
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
                                    data-bs-toggle="tab"
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
                                    data-bs-toggle="tab"
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
                                    data-bs-toggle="tab"
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
                                    data-bs-toggle="tab"
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
                    <!-- <div class="profile-work">
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
                                                          </div> -->
                </div>
                <div class="col-md-9">
                    <div class="tab-content profile-tab" id="myTabContent">
                        <!----------------USER ACCOUNT------------->
                        <div
                            class="tab-pane fade"
                            id="home"
                            role="tabpanel"
                            aria-labelledby="home-tab"
                            >
                            <div class="row">
                                <div class="col-md-6">
                                    <label><i class="fa-solid fa-envelope icon"></i>Email</label>
                                </div>
                                <div class="col-md-6">
                                    <p>${sessionScope.accountCur.accountEmail}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label><i class="fa-solid fa-signature icon"></i> Name</label>
                                </div>
                                <div class="col-md-4">
                                    <p>${sessionScope.accountDetail.accountDetailName}</p>
                                </div>
                                <div class="col-md-2">
                                    <p><i class="fa-regular fa-pen-to-square"></i></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label
                                        ><i class="fa-solid fa-calendar-days icon"></i> Date Of
                                        Birth</label
                                    >
                                </div>
                                <div class="col-md-4">
                                    <p>${sessionScope.accountDetail.accountDetailDob}</p>
                                </div>
                                <div class="col-md-2">
                                    <p><i class="fa-regular fa-pen-to-square"></i></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label
                                        ><i class="fa-solid fa-calendar-days icon"></i> Date Of
                                        Creation</label
                                    >
                                </div>
                                <div class="col-md-6">
                                    <p>${sessionScope.accountDetail.accountDetailDoc}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label><i class="fa-solid fa-lock icon"></i> Pass Word</label>
                                </div>
                                <div class="col-md-6">
                                    <p>
                                        <a
                                            data-bs-toggle="modal"
                                            data-bs-target="#changePasswordModal"
                                            href="javascript:void(0)"
                                            >Change</a
                                        >
                                    </p>
                                </div>
                            </div>
                        </div>
                        <!----------------END ACCOUNT------------->
                        <!----------------START ADDRESS------------->

                        <div
                            class="tab-pane fade"
                            id="address"
                            role="tabpanel"
                            aria-labelledby="address-tab"
                            >
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

                            <form
                                class="address-group shadow p-3 mb-4 bg-white rounded"
                                method="post"
                                action="addressEdit"
                                >
                                <!-- input -->
                                <div class="row">
                                    <div class="col-md-3">
                                        <input
                                            type="text"
                                            name="nameContact"
                                            class="form-control"
                                            value="${addressContact.nameContact}"
                                            />
                                    </div>
                                    <div class="col-md-3">
                                        <input
                                            type="text"
                                            name="phoneContact"
                                            class="form-control"
                                            value="${addressContact.phoneContact}"
                                            pattern="^[\w@_-]{8,30}$"
                                            title="Please enter real phone number"
                                            />
                                    </div>
                                    <div class="col-md-6">
                                        <input
                                            type="text"
                                            name="address"
                                            class="form-control"
                                            value="${addressContact.address}"
                                            />
                                    </div>
                                    <input type="hidden" name="id" value="${addressContact.id}" />
                                </div>
                                <!-- btn -->
                                <div class="row mt-2">
                                    <div class="col-md-3">
                                        <a
                                            class="btn-grad btn-cus"
                                            style="padding: 6px 12px; text-transform: none"
                                            >
                                            <i class="fa-solid fa-address-book"></i> Address
                                            default</a
                                        >
                                    </div>
                                    <div class="col-md-3"></div>
                                    <div class="col-md-6">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <input
                                                    type="submit"
                                                    name="type"
                                                    value="Delete"
                                                    class="btn btn-secondary btn-cus"
                                                    />
                                            </div>
                                            <div class="col-md-5">
                                                <input
                                                    type="submit"
                                                    name="type"
                                                    value="Set Default"
                                                    class="btn btn-secondary btn-cus"
                                                    />
                                            </div>
                                            <div class="col-md-3">
                                                <input
                                                    type="submit"
                                                    name="type"
                                                    value="Edit"
                                                    class="btn btn-secondary btn-cus"
                                                    />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- end form -->
                            </form>
                            <!-- Add more -->
                            <form
                                class="address-group shadow p-3 mb-4 mt-5 bg-white rounded"
                                method="post"
                                action="addressEdit"
                                >
                                <!-- input -->
                                <div class="row">
                                    <div class="col-md-3">
                                        <input
                                            type="text"
                                            name="nameContact"
                                            class="form-control"
                                            placeholder="New name contact"
                                            required=""
                                            />
                                    </div>
                                    <div class="col-md-3">
                                        <input
                                            type="text"
                                            name="phoneContact"
                                            class="form-control"
                                            placeholder="New phone contact"
                                            required=""
                                            pattern="^[\w@_-]{8,30}$"
                                            title="Please enter real phone number"
                                            />
                                    </div>
                                    <div class="col-md-6">
                                        <input
                                            type="text"
                                            name="address"
                                            class="form-control"
                                            placeholder="New address contact"
                                            required=""
                                            />
                                    </div>
                                    <input type="hidden" name="id" value="${addressContact.id}" />
                                </div>
                                <!-- btn -->
                                <div class="row mt-2">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-6"></div>
                                    <div class="col-md-3">
                                        <input
                                            type="submit"
                                            name="type"
                                            value="ADD MORE"
                                            class="btn-grad btn-cus"
                                            style="
                                            padding: 6px 12px;
                                            text-transform: none;
                                            border: none;
                                            "
                                            />
                                    </div>
                                </div>
                                <!-- end form -->
                            </form>
                        </div>
                        <!------------------delivering----------------------->
                        <div
                            class="tab-pane fade"
                            id="delivering"
                            role="tabpanel"
                            aria-labelledby="delivering-tab"
                            >
                            <table class="table shadow table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th scope="col">No</th>
                                        <th scope="col">Name Contact</th>
                                        <th scope="col">Phone Contact</th>
                                        <th scope="col">Order Date</th>
                                        <th scope="col">View</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Quoc Phung</tda>
                                        <td>0911092002</td>
                                        <td>2023-05-24</td>
                                        <td><a data-bs-toggle="modal" data-bs-target="#modal-order-detail" href="javascript:void(0)"><i class="fa-solid fa-eye"></i></a></td>
                                    </tr>
                                    <tr>
                                        <td scope="row">ádasd</td>
                                        <td>ádasd</tda>
                                        <td>ádasd</td>
                                        <td>ádasd</td>
                                        <td>ádasd</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!------------------Order Done----------------------->
                        <div
                            class="tab-pane fade"
                            id="done-order"
                            role="tabpanel"
                            aria-labelledby="done-order-tab"
                            >
                            <table class="table shadow table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th scope="col">No</th>
                                        <th scope="col">Name Contact</th>
                                        <th scope="col">Phone Contact</th>
                                        <th scope="col">Order Date</th>
                                        <th scope="col">Done Date</th>
                                        <th scope="col">View</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Quoc Phung</tda>
                                        <td>0911092003</td>
                                        <td>2023-05-24</td>
                                        <td>2023-05-26</td>
                                        <td><i class="fa-solid fa-eye"></i></td>
                                    </tr>
                                    <tr>
                                        <td scope="row">ádasd</td>
                                        <td>ádasd</tda>
                                        <td>ádasd</td>
                                        <td>ádasd</td>
                                        <td>ádasd</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!------------------------MODAL CHANGE PASSWORD-------------------------->   
        <%@include file="modal/modal-change-password.jsp" %>
        <!------------------------MODAL CHANGE INFORMATION-------------------------->
        <%@include file="modal/modal-change-information.jsp" %>
        <!-------------------------------MODAL ORDER DETAIL------------------------------------->
        <%@include file="modal/modal-order-detail.jsp" %>

    </body>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"
    ></script>
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"
        integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw=="
        crossorigin="anonymous"
        referrerpolicy="no-referrer"
    ></script>
    <script>
        $("#home-tab").addClass("active");
        $("#home").addClass("show active");
    </script>
</html>
