<div id="changePasswordModal" class="modal fade" role="dialog">
    <div class="modal-dialog" U>
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Change PassWord</h4>
                <a  style="cursor: pointer"
                    data-dismiss="modal"
                    ><i class="fa-solid fa-xmark"></i></a>
            </div>
            <div class="modal-body">
                <p style="color: red">${sessionScope.msgchangePassword}</p>
                <form action="profile" method="post" id="reused_form">
                    <input type="hidden" name="type" value="changePassword">
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
                            required
                            pattern="^(?=.*[A-Z]).{10,}$"
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