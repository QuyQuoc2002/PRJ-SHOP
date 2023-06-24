<div id="changePasswordModal" class="modal fade" role="dialog">
    <div class="modal-dialog" U>
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Change PassWord</h4>
                <button
                    type="button"
                    class="btn-close"
                    data-dismiss="modal"
                    ></button>
            </div>
            <div class="modal-body">
                
                        <sub style="color: red">${sessionScope.msg}</sub>
                <form action="profile" method="post" id="reused_form">
                    <input name="type" type="hidden" value="changePassword">
                    <div class="form-group mt-4">
                        <label for="oldPass"> Old Password:</label>
                        <input
                            type="password"
                            class="form-control"
                            id="oldPass"
                            name="oldPass"
                            required
                            maxlength="50"
                            />
                    </div>
                    <div class="form-group mt-4">
                        <label for="newPass"> New password:</label>
                        <input
                            type="password"
                            class="form-control"
                            id="newPass"
                            name="newPass"
                            pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"
                            title="password must contain at least eight characters, at least one number and both lower and uppercase letters and special characters"
                            required
                            maxlength="50"
                            />
                    </div>
                    <div class="form-group mt-4">
                        <label for="reNewPass"> Repeat new password:</label>
                        <input
                            type="password"
                            class="form-control"
                            id="reNewPass"
                            name="reNewPass"
                            required
                            maxlength="50"
                            />
                    </div>
                    <button
                        type="submit"
                        class="btn-grad mt-3"
                        id="btnChangePW"
                        style="width: 100%; border: none"
                        >
                        Submit
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>