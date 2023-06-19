<div id="changeInformModal" class="modal fade" role="dialog">
    <div class="modal-dialog" U>
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Change Information</h4>
                <a  style="cursor: pointer"
                    data-dismiss="modal"
                    ><i class="fa-solid fa-xmark"></i></a>
            </div>
            <div class="modal-body">
                <p style="color: red">${sessionScope.msgchangeInformation}</p>
                <form action="profile" method="post" id="reused_form">
                    <input type="hidden" name="type" value="changeInformation">
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