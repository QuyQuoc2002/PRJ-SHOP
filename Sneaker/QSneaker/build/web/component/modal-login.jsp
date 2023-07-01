<%-- 
    Document   : model-login
    Created on : Oct 8, 2022, 2:25:31 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!------------MODAL-------------->
<!--------Login------->
<div class="modal fade login" id="loginModal">
    <div class="modal-dialog login animated">
        <div class="modal-content bg-dark">
            <div class="modal-header">
                <h4 class="modal-title text-white" style="font-weight: bolder;">Login with</h4>
                <!-- <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> -->
                <button class="close-icon" type="button" data-bs-dismiss="modal"><i
                        class="fa fa-close text-white"></i></button>
            </div>
            <div class="modal-body">
                <div class="box">
                    <div class="content">
                        <div class="social">
                            <a id="github_login" href="#">
                                <i class="fa-brands fa-square-github"></i>
                            </a>
                            <a id="google_login" href="#">
                                <i class="fa-brands fa-square-google-plus"></i>
                            </a>
                            <a id="facebook_login" href="#">
                                <i class="fa-brands fa-square-facebook"></i>
                            </a>
                        </div>
                        <div class="division">
                            <div class="line l"></div>
                            <span class="text-white">or</span>
                            <div class="line r"></div>
                        </div>
                        <div class="form loginBox">
                            <div class="text-danger mb-2 text-center fw-bold">${message}</div>
                            <form method="post" action="login" accept-charset="UTF-8">
                                <input id="phoneNumber" class="form-control" type="text" placeholder="phoneNumber" name="phoneNumber" required="">
                                <input id="password" class="form-control" type="text" placeholder="Password" name="password" required="">
                                <input type="hidden" name="myHrefLogin" id="myHrefLogin" value="" />
                                <script>document.getElementById('myHrefLogin').value = location.href;</script>
                                <input class="btn-grad btn-default btn-login" type="submit" value="Login"
                                       onclick="loginAjax()">
                            </form>
                        </div>
                    </div>
                </div>
                <div class="box">
                    <div class="content registerBox" style="display:none;">
                        <div class="text-danger mb-2 text-center fw-bold">${messageR}</div>
                        <div class="form">
                            <form method="post" html="{:multipart=>true}" data-remote="true" action="register" accept-charset="UTF-8">
                                <div class="res">
                                    <input id="phoneNumber" class="form-control" type="text" placeholder="phoneNumber" name="phoneNumber">
                                    <p>Telephone must be a valid telephone number (10 digits)</p>
                                </div>
                                <div class="res">
                                    <input id="password" class="form-control" type="text" placeholder="Password" name="password">
                                    <p>Password must alphanumeric (@, _ and - are also allowed) and be 8 - 20 characters </p>
                                </div>
                                <input id="password_confirmation" class="form-control" type="password" placeholder="Repeat Password" name="password_confirmation">
                                <input type="hidden" name="myHrefRes" id="myHrefRes" value="" />
                                <script>document.getElementById('myHrefRes').value = location.href;</script>
                                <input id="btn-submit" class="btn-grad btn-default btn-register" type="submit"
                                       value="Create account" name="commit">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="forgot login-footer">
                    <span>Looking to
                        <a href="javascript: showRegisterForm();">create an account</a>
                        ?</span>
                </div>
                <div class="forgot register-footer" style="display:none">
                    <span>Already have an account?</span>
                    <a href="javascript: showLoginForm();">Login</a>
                </div>
            </div>
        </div>
    </div>
</div>
