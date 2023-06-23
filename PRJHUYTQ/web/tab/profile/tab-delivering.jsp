<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div
    class="tab-pane fade"
    id="delivering"
    role="tabpanel"
    aria-labelledby="delivering-tab"
    >
    <table class="table shadow table-hover table-bordered">
        <thead>
            <tr>
                <th scope="col">No</th>
                <th scope="col">Name Contact</th>
                <th scope="col">Phone Contact</th>
                <th scope="col">Order Date</th>
                <th scope="col">Expected Date</th>
                <th scope="col">View</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${requestScope.lstDeliveringOrder}" var="o" varStatus="i">
                <tr>
                    <td>${i.count}</td>
                    <td>${o.orderNameContact}</td>
                    <td>${o.orderPhoneContact}</td>
                    <td>${o.orderCreateDate}</td>
                    <td>${o.orderExpectedDate}</td>
                    <td><a data-toggle="modal" data-target="#modal-order-detail" href="javascript:void(0)" onclick="getAllOrderDetail(${o.orderId});"><i class="fa-solid fa-eye"></i></a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>