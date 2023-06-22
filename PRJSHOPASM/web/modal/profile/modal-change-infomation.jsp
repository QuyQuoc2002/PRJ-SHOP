<div id="changeInformModal" class="modal fade" role="dialog">
    <div class="modal-dialog" U>
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Change Information</h4>
                <button
                    type="button"
                    class="btn-close"
                    data-dismiss="modal"
                    ></button>
            </div>
            <div class="modal-body">
                <form action="profile" method="post" id="reused_form">
                    <input name="type" type="hidden" value="changeInformation">
                    <div class="form-group mt-4">
                        <label for="name"> Name:</label>
                        <input
                            type="text"
                            class="form-control"
                            id="name"
                            name="accountDetailName"
                            value="${sessionScope.accountDetail.accountDetailName}"
                            />
                    </div>
                    <div class="form-group mt-4">
                        <label for="dob"> Date of Birth:</label>
                        <input
                            type="date"
                            class="form-control"
                            id="dob"
                            name="accountDetailDob"
                            value="${sessionScope.accountDetail.accountDetailDob}"
                            />
                    </div>

                    <button
                        type="submit"
                        class="btn-grad mt-3"
                        id="btnChangeInf"
                        style="width: 100%; border: none"
                        >
                        Submit
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>