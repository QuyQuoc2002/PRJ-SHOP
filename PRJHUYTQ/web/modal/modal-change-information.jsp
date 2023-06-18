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
                <form action="changeInf" method="post" id="reused_form">
                    <div class="form-group mt-4">
                        <label for="name"> Name:</label>
                        <input
                            type="text"
                            class="form-control"
                            id="name"
                            name="nickName"
                            placeholder="Quoc Phung"
                            />
                    </div>
                    <div class="form-group mt-4">
                        <label for="dob"> Date of Birth:</label>
                        <input
                            type="text"
                            class="form-control"
                            id="dob"
                            name="dob"
                            placeholder="11/09/2002"
                            pattern="^\d{4}[\-\/\s]?((((0[13578])|(1[02]))[\-\/\s]?(([0-2][0-9])|(3[01])))|(((0[469])|(11))[\-\/\s]?(([0-2][0-9])|(30)))|(02[\-\/\s]?[0-2][0-9]))$"
                            title="Enter a date in this format YYYY-MM-DD"
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