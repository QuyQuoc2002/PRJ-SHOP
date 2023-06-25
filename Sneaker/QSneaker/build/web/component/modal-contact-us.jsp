<%-- 
    Document   : modal-contact-us
    Created on : Oct 9, 2022, 12:59:26 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="contactUsModal" class="modal fade" role="dialog">
    <div class="modal-dialog"U>
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    Contact Us
                </h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form role="form" method="post" id="reused_form" >
                    <p> Send your message in the form below and we will get back to you as early as possible. </p>
                    <div class="form-group">
                        <label for="name"> Name:</label>
                        <input type="text" class="form-control" id="name" name="name" required maxlength="50">
                    </div>
                    <div class="form-group">
                        <label for="email"> Email:</label>
                        <input type="email" class="form-control" id="email" name="email" required maxlength="50">
                    </div>
                    <div class="form-group">
                        <label for="name"> Message:</label>
                        <textarea class="form-control" type="textarea" name="message" id="message" placeholder="Your Message Here" maxlength="6000" rows="7"></textarea>
                    </div>
                    <a type="submit" class="btn-grad mt-3" id="btnContactUs" style="width: 100%">Submit</a>
                </form>
                <div id="success_message" style="width:100%; height:100%; display:none; "> <h3>Sent your message successfully!</h3> </div>
                <div id="error_message" style="width:100%; height:100%; display:none; "> <h3>Error</h3> Sorry there was an error sending your form. </div>
            </div>
        </div>
    </div>
</div>
