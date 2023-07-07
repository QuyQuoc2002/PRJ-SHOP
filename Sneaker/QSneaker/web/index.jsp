<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import = "java.util.*" %>
<%@page import = "entity.ModelSneaker" %>

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
    <link rel="stylesheet" href="assets/css/index.css">
    <!--login/register js css-->
    <script src="assets/js/login-register.js"></script>
    <link rel="stylesheet" href="assets/css/login-register.css">
    <link rel="stylesheet" href="assets/css/feedback.css">
    


  </head>

  <body>

    <div class="lens-center-red len-red-1"></div>
    <!-- <div class="lens-center-blue len-blue-1"></div> -->
    <!-- <div class="lens-center-red len-red-2"></div> -->
    <div class="lens-center-blue len-blue-2"></div>
    <!-- <div class="lens-center-red len-red-3"></div> -->

    <div class="btn-grad2 decor1" style="position: absolute;"></div>
    <div class="btn-grad2 decor2" style="position: absolute;"></div>
    <div class="btn-grad2 decor3" style="position: absolute;"></div>

    <!--NAVIGATION-->
    <nav class="navbar navbar-expand-sm navbar-dark mt-3" style="background-color: none;">
      <div class="container-fluid">
        <a class="navbar-brand" href="javascript:void(0)"><img class="logo" src="assets/img/logo1.png" alt=""></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mynavbar">
          <ul class="navbar-nav me-auto">
            <li class="nav-item">
              <a class="nav-link text-white" href="#">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link text-white" href="#about">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link text-white" href="#popular">Popular</a>
            </li>
            <li class="nav-item">
              <a class="nav-link text-white" href="#Feedback">Feedback</a>
            </li>
            <li class="nav-item">
              <a class="nav-link text-white" href="shop">Shop</a>
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

    <div id="event" class="container mt-5" style="margin-bottom: 100px;">
      <div class="row">
        <div class="script text-white col-md-5" style="padding:70px 0 0 30px;">
          <p class="title">Fall</p>
          <p class="title">Collections</p>
          <p class="title"><span class="text-danger">2022</span></p>
          <p class="text-white title-detail">The styles of shoe available to consumers <br> are endless and profit
            also endless</p>
          <a class="btn-grad" href="javascript:void(0)">Shop Now</a> <img style="padding-top: 0;"
                                                                          class="img-arrow" src="assets/img/Picture1.png" alt="">
          <div class="rate" style="margin-left: 290px;">
            <div>
              <span class="rate-number">4.9</span> | <i class="fa-solid fa-star"></i><i
                class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i
                class="fa-solid fa-star"></i>
            </div>
            <div>2022 total review</div>
          </div>
        </div>
        <div class="image-sneaker col-md-6" style="padding-left: 100px;">
          <img src="assets/img/sneaker-img.png" alt="">
          <div class="script-img text-white glass">
            <h3>Get up to 30% off</h3>
            <p>You can get up to 30 percent <br> discount form here</p>
          </div>
        </div>
      </div>

    </div>

    <!--Popular-->
    <div id="popular">
      <div class="container my-3">
        <h2 class="text-white justify-content-center" , style="font-size: 60px;">Populars <span
            class="text-danger">Product</span></h2>
        <div class="row mx-auto my-auto mt-5">
          <div id="recipeCarousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner " role="listbox">
              <c:forEach items="${lstNewProduct}" var="modelSneaker" varStatus="i">
                <c:choose>

                  <c:when test = "${i.index == 0}">
                    <div class="carousel-item active">
                    </c:when>
                    <c:otherwise>
                      <div class="carousel-item">
                      </c:otherwise>
                    </c:choose>
                    <div class="col-md-3 d-flex justify-content-center">
                      <!--Add card-->
                      <div class="card" style="width:270px">
                        <img class="card-img-top" src="assets/img/ImgProduct/${modelSneaker.img}jpg"
                             alt="Card image">
                        <i class="fa-solid fa-heart"></i>
                        <div class="card-body">
                          <div class="rate">
                            <i class="fa-solid fa-star" style="line-height: 2;"></i>
                            <p style="font-size:20px; margin-bottom: 0;">(4.5)</p>
                          </div>
                          <h5 class="card-title">${modelSneaker.name}</h5>
                          <div class="price" style="display: flex; position: relative;">
                            <p class="card-text mb-0" style="font-size: 22px; font-weight: 600;">${modelSneaker.price}
                            </p>
                            <a href="product-detail?id=${modelSneaker.id}" class="btn-grad">Buy Now</a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </c:forEach>
              </div> <a class="carousel-control-prev bg-transparent w-aut" href="#recipeCarousel" role="button"
                        data-bs-slide="prev"> <span class="carousel-control-prev-icon" aria-hidden="true"></span> </a>
              <a class="carousel-control-next bg-transparent w-aut" href="#recipeCarousel" role="button"
                 data-bs-slide="next"> <span class="carousel-control-next-icon" aria-hidden="true"></span> </a>
            </div>
          </div>
        </div>
      </div>
      <div class="container my-3">
        <h2 id="Feedback" class="text-white justify-content-center mt-5 mb-3" , style="font-size: 60px; font-family: broadway">Our <span
            class="text-danger">Feedback</span></h2>
        <section class="articles">
          <article>
            <div class="article-wrapper">
              <figure>
                <img src="https://picsum.photos/id/1011/800/450" alt="" />
              </figure>
              <div class="article-body">
                <h2>This is some title</h2>
                <p>
                  Curabitur convallis ac quam vitae laoreet. Nulla mauris ante, euismod sed lacus sit amet, congue bibendum
                  eros. Etiam mattis lobortis porta. Vestibulum ultrices iaculis enim imperdiet egestas.
                </p>
              </div>
            </div>
          </article>
          <article>

            <div class="article-wrapper">
              <figure>
                <img src="https://picsum.photos/id/1005/800/450" alt="" />
              </figure>
              <div class="article-body">
                <h2>This is some title</h2>
                <p>
                  Curabitur convallis ac quam vitae laoreet. Nulla mauris ante, euismod sed lacus sit amet, congue bibendum
                  eros. Etiam mattis lobortis porta. Vestibulum ultrices iaculis enim imperdiet egestas.
                </p>
              </div>
            </div>
          </article>
          <article>

            <div class="article-wrapper">
              <figure>
                <img src="https://picsum.photos/id/103/800/450" alt="" />
              </figure>
              <div class="article-body">
                <h2>This is some title</h2>
                <p>
                  Curabitur convallis ac quam vitae laoreet. Nulla mauris ante, euismod sed lacus sit amet, congue bibendum
                  eros. Etiam mattis lobortis porta. Vestibulum ultrices iaculis enim imperdiet egestas.
                </p>
              </div>
            </div>
          </article>
        </section>
      </div>

      <div id="about" class="container" style="padding-top: 100px;">
        <div class="row mt-5">
          <div class="col-md-6" style="position: relative">
            <img class="img-about" src="assets/img/about.png" alt="">
            <div class="img-bg"><img src="assets/img/img-bg-about.jfif.jpg" alt=""></div>
            <div class="script-img text-white glass">
              <h3>Get up to <br> 30% off</h3>
              <p>You can get up to 30 <br> percent discount <br> form here</p>
            </div>
          </div>

          <div class="col-md-6">
            <p class="text-ro" style="font-size: 28px; font-family: Broadway;">About Us</p>
            <p class="text-white" style="font-size: 40px; line-height: 1; font-family: Broadway;">We Provide <span
                class="text-ro">Hight</span> <br> Quality Shoes.</p>
            <p class="text-white">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem
              Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took
              a galley of type and scrambled it to make a type specimen book. <br><br> It has survived not only
              five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It
              was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,
              and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem
              Ipsum.</p>
            <div class="btn-grad" style="margin: 0;">EXPLORE MORE</div>
          </div>
        </div>
      </div>
      <div style="margin-top: 100px"></div>
      <%@include file="component/footer.jsp" %>
      <%@include file="component/modal-login.jsp" %>
      <%@include file="component/modal-contact-us.jsp" %>
  </body>
  <script src="assets/js/d2.js"></script>
  <script src="assets/js/bootstrap.bundle.min.js"></script>
  <script src="assets/js/common.js"></script>
  <script src="assets/js/jquery.min.js"></script>
  <script src="assets/js/register-validate.js"></script>
  <script>
                        const message = '<%= session.getAttribute("message") %>';
                        if (message !== 'null') {
                          const myModal = new bootstrap.Modal(document.getElementById('loginModal'));
                          openLoginModal();
                        }
                        const messageR = '<%= session.getAttribute("messageR") %>';
                        if (messageR === 'Regist successful') {
                          alert(messageR);
                        } else if (messageR !== 'null') {
                          openRegisterModal();
                        }
  </script>

  <%
      request.getSession().removeAttribute("message");
      request.getSession().removeAttribute("messageR");
  %>
</html>
