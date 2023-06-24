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
                    data-toggle="modal"
                    data-target="#changePasswordModal"
                    href="javascript:void(0)"
                    >Change</a
                >
            </p>
        </div>
    </div>
</div>