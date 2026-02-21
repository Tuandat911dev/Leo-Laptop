<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container my-5">
    <h2 class="mb-4 font-weight-bold"><i class="fas fa-history mr-2"></i>Lịch sử mua hàng</h2>

    <c:if test="${empty orders}">
        <div class="text-center py-5 shadow-sm bg-white rounded">
            <p class="mt-3 text-muted">Bạn chưa có đơn hàng nào.</p>
            <a href="/" class="btn btn-primary">Mua sắm ngay</a>
        </div>
    </c:if>

    <c:forEach var="order" items="${orders}">
        <div class="card shadow-sm mb-4 border-left-primary">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <div>
                    <span class="text-muted small">Mã đơn hàng:</span>
                    <span class="font-weight-bold text-primary">#ORD-${order.id}</span>
                </div>
                <div>
                    <span class="badge badge-pill
                        ${order.orderStatus == 'PENDING' ? 'badge-warning' :
                          order.orderStatus == 'PROCESSING' ? 'badge-info' :
                          order.orderStatus == 'DELIVERED' ? 'badge-success' : 'badge-secondary'}">
                            ${order.orderStatus}
                    </span>
                </div>
            </div>

            <div class="card-body">
                <div class="row">
                    <div class="col-md-8">
                        <p class="mb-1"><strong>Người nhận:</strong> ${order.receiverName}</p>
                        <p class="mb-1 text-muted small"><i class="fas fa-map-marker-alt"></i> ${order.receiverAddress}</p>
                        <p class="mb-0 text-muted small"><i class="fas fa-phone"></i> ${order.receiverPhone}</p>
                    </div>
                    <div class="col-md-4 text-md-right mt-3 mt-md-0">
                        <p class="mb-0 text-muted small">Tổng thanh toán</p>
                        <h4 class="text-danger font-weight-bold">
                            <fmt:formatNumber value="${order.totalPrice}" type="currency" currencySymbol="đ"/>
                        </h4>
                    </div>
                </div>
            </div>

            <div class="card-footer bg-light text-right">
                <a href="/history/detail/${order.id}" class="btn btn-sm btn-outline-secondary">Chi tiết</a>

                <c:if test="${order.orderStatus == 'PENDING' || order.orderStatus == 'PROCESSING'}">
                    <a href="/order/edit/${order.id}" class="btn btn-sm btn-outline-primary ml-2">
                        <i class="fas fa-edit"></i> Sửa thông tin
                    </a>

                    <button class="btn btn-sm btn-outline-danger ml-2"
                            onclick="confirmCancel(${order.id})">
                        <i class="fas fa-times"></i> Hủy đơn
                    </button>
                </c:if>
            </div>
        </div>
    </c:forEach>
</div>

<div class="modal fade" id="cancelModal" tabindex="-1">
    <div class="modal-dialog">
        <form id="cancelForm" method="POST">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-danger">Xác nhận hủy đơn hàng</h5>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    Bạn có chắc chắn muốn hủy đơn hàng <strong id="cancelOrderIdText"></strong> không?
                    Hành động này không thể hoàn tác.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-danger">Xác nhận hủy</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script>
    function confirmCancel(orderId) {
        document.getElementById('cancelOrderIdText').innerText = '#ORD-' + orderId;
        document.getElementById('cancelForm').action = '/order/cancel/' + orderId;
        $('#cancelModal').modal('show');
    }
</script>