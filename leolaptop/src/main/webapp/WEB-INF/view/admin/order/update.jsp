<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container-fluid">
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Cập nhật đơn hàng #ORD-${order.id}</h1>
        <a href="/admin/orders" class="d-none d-sm-inline-block btn btn-sm btn-secondary shadow-sm">
            <i class="fas fa-arrow-left fa-sm text-white-50"></i> Quay lại danh sách
        </a>
    </div>

    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Thông tin chi tiết đơn hàng</h6>
                </div>
                <div class="card-body">
                    <form:form action="/admin/orders/update/${order.id}" method="post" modelAttribute="order">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="font-weight-bold text-muted">Tên người nhận</label>
                                <input type="text" class="form-control-plaintext border-bottom"
                                       value="${order.receiverName}" readonly>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="font-weight-bold text-muted">Số điện thoại</label>
                                <input type="text" class="form-control-plaintext border-bottom"
                                       value="${order.receiverPhone}" readonly>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="font-weight-bold text-muted">Địa chỉ nhận hàng</label>
                            <textarea class="form-control-plaintext border-bottom" rows="2" readonly>${order.receiverAddress}</textarea>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="font-weight-bold text-muted">Phương thức thanh toán</label>
                                <div class="form-control-plaintext border-bottom">
                                    <span class="badge badge-info">${order.paymentMethod}</span>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="font-weight-bold text-muted">Tổng tiền thanh toán</label>
                                <div class="form-control-plaintext border-bottom text-danger font-weight-bold">
                                    <fmt:formatNumber value="${order.totalPrice}" type="currency" currencySymbol="đ"/>
                                </div>
                            </div>
                        </div>

                        <hr class="my-4">

                        <div class="form-group bg-light p-4 rounded border">
                            <label for="orderStatus" class="font-weight-bold text-primary">
                                <i class="fas fa-truck-loading mr-2"></i>Trạng thái đơn hàng
                            </label>
                            <form:select path="orderStatus"
                                         class="form-control custom-select shadow-sm ${order.orderStatus == 'DELIVERED' || order.orderStatus == 'CANCELLED' ? 'bg-light' : ''}"
                                         id="orderStatus"
                                         disabled="${order.orderStatus == 'DELIVERED' || order.orderStatus == 'CANCELLED' ? 'true' : 'false'}">
                                <form:option value="PENDING">Đang chờ xử lý</form:option>
                                <form:option value="PROCESSING">Đang xử lý</form:option>
                                <form:option value="DELIVERED">Đã giao hàng</form:option>
                                <form:option value="CANCELLED">Đã hủy đơn</form:option>
                            </form:select>
                            <c:if test="${order.orderStatus == 'DELIVERED' || order.orderStatus == 'CANCELLED'}">
                                <form:hidden path="orderStatus" />
                            </c:if>
                            <small class="form-text text-muted mt-2">
                                * Lưu ý: Việc thay đổi trạng thái sẽ ảnh hưởng đến quy trình vận hành và thông báo cho khách hàng.
                            </small>
                        </div>

                        <div class="form-group bg-light p-4 rounded border">
                            <label for="paymentStatus" class="font-weight-bold text-primary">
                                <i class="fas fa-truck-loading mr-2"></i>Trạng thái thanh toán
                            </label>
                            <form:select path="paymentStatus"
                                         class="form-control custom-select shadow-sm ${order.paymentStatus == 'PAID' ? 'bg-light' : ''}"
                                         id="orderStatus"
                                         disabled="${order.orderStatus == 'DELIVERED'
                                         || order.orderStatus == 'CANCELLED'
                                         || order.orderStatus == 'PENDING'}">
                                <form:option value="PAID">Đã thanh toán</form:option>
                                <form:option value="UN_PAID">Chưa thanh toán</form:option>
                            </form:select>
                            <c:if test="${order.orderStatus == 'DELIVERED' || order.orderStatus == 'CANCELLED' || order.orderStatus == 'PENDING'}">
                                <form:hidden path="paymentStatus" />
                            </c:if>
                        </div>

                        <c:choose>
                            <c:when test="${order.orderStatus != 'DELIVERED' && order.orderStatus != 'CANCELLED'}">
                                <div class="text-right mt-4">
                                    <button type="submit" class="btn btn-primary px-5 shadow">
                                        <i class="fas fa-save mr-2"></i>Lưu thay đổi
                                    </button>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="text-right mt-4">
                                    <a href="/admin/orders" class="btn btn-secondary px-5">
                                        <i class="fas fa-chevron-left mr-2"></i>Quay lại
                                    </a>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>