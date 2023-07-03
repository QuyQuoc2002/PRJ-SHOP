<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <c:forEach items="${requestScope.lstAccountContact}" var="ac">
        <form
            class="address-group shadow p-3 mb-4 bg-white rounded"
            method="post"
            action="profile"
            >
            <input name="type" type="hidden" value="updateAccountContact">
            <input name="accountContactId" type="hidden" value="${ac.accountContactId}">
            <!-- input -->
            <div class="row">
                <div class="col-md-3">
                    <input
                        type="text"
                        name="accountContactName"
                        class="form-control"
                        value="${ac.accountContactName}"
                        />
                </div>
                <div class="col-md-3">
                    <input
                        type="text"
                        name="accountContactMobile"
                        class="form-control"
                        value="${ac.accountContactMobile}"
                        pattern="^[0-9]{10}$"
                        title="Please enter real phone number"
                        />
                </div>
                <div class="col-md-6">
                    <input
                        type="text"
                        name="accountContactAddress"
                        class="form-control"
                        value="${ac.accountContactAddress}"
                        />
                </div>
                <input type="hidden" name="id" value="${ac.accountContactId}" />
            </div>
            <!-- btn -->
            <div class="row mt-2">
                <div class="col-md-3">
                    <c:if test="${ac.accountContactDefault}">
                    <a
                        class="btn-grad btn-cus"
                        style="padding: 6px 12px; text-transform: none"
                        >
                        <i class="fa-solid fa-address-book"></i> Address default</a
                    >
                    </c:if>
                </div>
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-4">
                            <c:if test="${!ac.accountContactDefault}">
                            <input
                                type="submit"
                                name="typeUpdate"
                                value="Delete"
                                class="btn btn-secondary btn-cus"
                                />
                            </c:if>
                        </div>
                        <div class="col-md-5">
                            <c:if test="${!ac.accountContactDefault}">
                            <input
                                type="submit"
                                name="typeUpdate"
                                value="Set Default"
                                class="btn btn-secondary btn-cus"
                                />
                            </c:if>
                        </div>
                        <div class="col-md-3">
                            <input
                                type="submit"
                                name="typeUpdate"
                                value="Edit"
                                class="btn btn-secondary btn-cus"
                                />
                        </div>
                    </div>
                </div>
            </div>
            <!-- end form -->
        </form>
    </c:forEach>
    <!-- Add more -->
    <form
        class="address-group shadow p-3 mb-4 mt-5 bg-white rounded"
        method="post"
        action="profile"
        >
        <input name="type" type="hidden" value="addAccountContact">
        <!-- input -->
        <div class="row">
            <div class="col-md-3">
                <input
                    type="text"
                    name="accountContactName"
                    class="form-control"
                    placeholder="New name contact"
                    required=""
                    />
            </div>
            <div class="col-md-3">
                <input
                    type="text"
                    name="accountContactMobile"
                    class="form-control"
                    placeholder="New phone contact"
                    required=""
                    pattern="^[0-9]{10}$"
                    title="Please enter real phone number"
                    />
            </div>
            <div class="col-md-6">
                <input
                    type="text"
                    name="accountContactAddress"
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