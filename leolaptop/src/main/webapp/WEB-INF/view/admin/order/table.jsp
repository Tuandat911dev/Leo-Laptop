<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="/css/admin/user/table.css" rel="stylesheet">
<style>
    .badge-status {
        padding: 0.5em 0.8em;
        border-radius: 20px;
        font-size: 0.85rem;
        font-weight: 600;
    }

    .status-PENDING {
        background-color: #ffeeba;
        color: #856404;
    }

    .status-SHIPPED {
        background-color: #b8daff;
        color: #004085;
    }

    .status-DELIVERED {
        background-color: #c3e6cb;
        color: #155724;
    }

    .status-CANCELLED {
        background-color: #f5c6cb;
        color: #721c24;
    }

    .payment-MOMO {
        color: #ae2070;
        font-weight: bold;
    }

    .payment-COD {
        color: #28a745;
        font-weight: bold;
    }

    .order-item-row {
        border-bottom: 1px solid #eee;
        padding: 10px 0;
    }

    .order-item-img {
        width: 50px;
        height: 50px;
        object-fit: cover;
        border-radius: 4px;
    }
</style>

<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Quản lý Đơn hàng</h1>
</div>

<div class="card shadow mb-4">
    <div class="card-header py-3 d-flex justify-content-between align-items-center">
        <h6 class="m-0 font-weight-bold text-primary">Danh sách đơn hàng</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                <thead class="thead-light">
                <tr>
                    <th>Mã đơn</th>
                    <th>Khách hàng</th>
                    <th>Tổng tiền</th>
                    <th>Thanh toán</th>
                    <th>Trạng thái</th>
                    <th>Ngày đặt</th>
                    <th class="text-center">Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="order" items="${orderList}">
                    <tr>
                        <td>
                            <button type="button" class="btn btn-link p-0 font-weight-bold"
                                    onclick="showOrderDetail(${order.id})">
                                #ORD-${order.id}
                            </button>
                        </td>
                        <td>
                            <div class="font-weight-bold">${order.receiverName}</div>
                            <small class="text-muted">${order.receiverPhone}</small>
                        </td>
                        <td class="text-danger font-weight-bold">
                            <fmt:formatNumber value="${order.totalPrice}" type="currency" currencySymbol="đ"/>
                        </td>
                        <td>
                            <span class="payment-${order.paymentMethod}">${order.paymentMethod}</span>
                            <br>
                            <small class="badge ${order.paymentStatus == 'PAID' ? 'badge-success' : 'badge-secondary'}">
                                    ${order.paymentStatus}
                            </small>
                        </td>
                        <td>
                            <span class="badge-status status-${order.orderStatus}">${order.orderStatus}</span>
                        </td>
                        <td>10/02/2026</td>
                        <td class="text-center">
                            <a href="/admin/orders/update/${order.id}" class="btn btn-warning btn-circle-sm mr-1">
                                <i class="fas fa-edit"></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <nav aria-label="Page navigation example mt-3">
                <ul class="pagination justify-content-end">
                    <li class="page-item ${page == 1 ? 'disabled' : ''}">
                        <a class="page-link" href="/admin/orders?page=${page - 1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <li class="page-item ${page == i ? 'active' : ''}">
                            <a class="page-link" href="/admin/orders?page=${i}">${i}</a>
                        </li>
                    </c:forEach>
                    <li class="page-item ${page == totalPages ? 'disabled' : ''}">
                        <a class="page-link" href="/admin/orders?page=${page + 1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>

<div id="offcanvasOverlay" onclick="closeOffcanvas()"></div>
<div id="offcanvasUserDetails" style="width: 500px;">
    <div class="off-header">
        <h5 class="m-0 font-weight-bold">Chi tiết Đơn hàng <span id="off-order-id"></span></h5>
        <button class="close-btn" onclick="closeOffcanvas()">&times;</button>
    </div>

    <div class="off-body">
        <div id="loadingSpinner" class="text-center d-none my-5">
            <div class="spinner-border text-primary" role="status"></div>
        </div>

        <div id="orderDetailContent">
            <div class="card mb-3 bg-light border-0">
                <div class="card-body p-3">
                    <label class="small text-uppercase text-muted font-weight-bold">Thông tin giao hàng</label>
                    <div id="off-receiver-name" class="font-weight-bold"></div>
                    <div id="off-receiver-phone"></div>
                    <div id="off-receiver-address" class="small text-muted"></div>
                </div>
            </div>

            <div class="detail-item">
                <label>Ghi chú đơn hàng</label>
                <div id="off-notes" class="font-italic small text-muted">Không có ghi chú.</div>
            </div>

            <hr>
            <label class="small text-uppercase text-muted font-weight-bold">Danh sách sản phẩm</label>
            <div id="off-order-items">
            </div>

            <div class="mt-4 p-3 bg-gray-100 rounded">
                <div class="d-flex justify-content-between align-items-center">
                    <span class="font-weight-bold">Tổng cộng:</span>
                    <span id="off-total-price" class="h4 mb-0 text-danger font-weight-bold"></span>
                </div>
            </div>

            <a href="#" id="off-edit-order" class="btn btn-primary btn-block mt-4 shadow-sm">
                Cập nhật trạng thái đơn hàng
            </a>
        </div>
    </div>
</div>

<script src="/js/admin/order/script.js"></script>