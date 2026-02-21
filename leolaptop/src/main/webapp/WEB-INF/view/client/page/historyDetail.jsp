<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="container my-5">
    <div class="card shadow-sm">
        <div class="card-header bg-white py-3">
            <div class="row">
                <div class="col-md-6">
                    <h5 class="mb-0">Chi tiết đơn hàng <span class="text-primary">#ORD-${order.id}</span></h5>
                    <small class="text-muted">Ngày đặt: 10/02/2026</small>
                </div>
                <div class="col-md-6 text-md-right">
                    <span class="badge badge-success p-2 text-dark">Trạng thái:
                        <c:choose>
                            <c:when test="${order.orderStatus == 'PENDING'}">
                                <span class="text-warning">Đang Chờ Xử Lý</span>
                            </c:when>
                            <c:when test="${order.orderStatus == 'PROCESSING'}">
                                <span class="text-info">Đang Xử Lý</span>
                            </c:when>
                            <c:when test="${order.orderStatus == 'DELIVERED'}">
                                <span class="text-success">Đã Giao</span>
                            </c:when>
                            <c:otherwise>
                                <span class="text-danger">Đã Huỷ</span>
                            </c:otherwise>
                        </c:choose>
                    </span>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div class="row mb-4 text-center">
                <c:choose>
                    <c:when test="${order.orderStatus == 'PENDING'}">
                        <div class="col"><i class="fas fa-file-invoice fa-2x text-primary"></i>
                            <p class="small">Đã đặt</p></div>
                        <div class="col"><i class="fas fa-box-open fa-2x text-muted"></i>
                            <p class="small">Đang xử lý</p></div>
                        <div class="col"><i class="fas fa-truck fa-2x text-muted"></i>
                            <p class="small">Đang giao</p></div>
                        <div class="col"><i class="fas fa-check-circle fa-2x text-muted"></i>
                            <p class="small">Hoàn thành</p></div>
                    </c:when>
                    <c:when test="${order.orderStatus == 'PROCESSING'}">
                        <div class="col"><i class="fas fa-file-invoice fa-2x text-primary"></i>
                            <p class="small">Đã đặt</p></div>
                        <div class="col"><i class="fas fa-box-open fa-2x text-primary"></i>
                            <p class="small">Đang xử lý</p></div>
                        <div class="col"><i class="fas fa-truck fa-2x text-primary"></i>
                            <p class="small">Đang giao</p></div>
                        <div class="col"><i class="fas fa-check-circle fa-2x text-muted"></i>
                            <p class="small">Hoàn thành</p></div>
                    </c:when>
                    <c:when test="${order.orderStatus == 'DELIVERED'}">
                        <div class="col"><i class="fas fa-file-invoice fa-2x text-primary"></i>
                            <p class="small">Đã đặt</p></div>
                        <div class="col"><i class="fas fa-box-open fa-2x text-primary"></i>
                            <p class="small">Đang xử lý</p></div>
                        <div class="col"><i class="fas fa-truck fa-2x text-primary"></i>
                            <p class="small">Đang giao</p></div>
                        <div class="col"><i class="fas fa-check-circle fa-2x text-primary"></i>
                            <p class="small">Hoàn thành</p></div>
                    </c:when>
                    <c:otherwise>
                        <div class="col"><i class="fas fa-file-invoice fa-2x text-primary"></i>
                            <p class="small">Đã đặt</p></div>
                        <div class="col"><i class="fas fa-box-open fa-2x text-primary"></i>
                            <p class="small">Đang xử lý</p></div>
                        <div class="col"><i class="fas fa-truck fa-2x text-primary"></i>
                            <p class="small">Đang giao</p></div>
                        <div class="col"><i class="fas fa-check-circle fa-2x text-primary"></i>
                            <p class="small">
                                Đã Huỷ
                            </p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="row mb-4">
                <div class="col-md-6">
                    <h6 class="font-weight-bold">Địa chỉ nhận hàng</h6>
                    <p class="mb-1">${order.receiverName}</p>
                    <p class="mb-1 text-muted small">${order.receiverPhone}</p>
                    <p class="text-muted small">${order.receiverAddress}</p>
                </div>
                <div class="col-md-6 border-left">
                    <h6 class="font-weight-bold">Hình thức thanh toán</h6>
                    <p class="text-muted small">${order.paymentMethod}</p>
                    <p class="small">Trạng thái: <span
                            class="text-success
                            font-weight-bold">${order.paymentStatus == "PAID" ? "Đã Thanh Toán" : "Chưa Thanh Toán"}</span>
                    </p>
                </div>
            </div>

            <table class="table border-bottom">
                <thead class="bg-light">
                <tr>
                    <th>Sản phẩm</th>
                    <th class="text-center">Số lượng</th>
                    <th class="text-right">Giá</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${order.orderDetails}">
                    <tr>
                        <td>
                            <div class="d-flex align-items-center">
                                <img src="/images/product/${item.product.image}" width="50" class="mr-3 rounded">
                                <div>
                                    <div class="font-weight-bold">${item.product.name}</div>
                                    <small class="text-muted">Phân loại: Xanh, Size L</small>
                                </div>
                            </div>
                        </td>
                        <td class="text-center">x${item.quantity}</td>
                        <td class="text-right text-danger font-weight-bold">
                            <fmt:formatNumber value="${item.product.price}" type="currency" currencySymbol="đ"/>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <div class="row justify-content-end">
                <div class="col-md-4">
                    <div class="d-flex justify-content-between mb-2">
                        <span>Tổng tiền hàng:</span>
                        <span><fmt:formatNumber value="${order.totalPrice - 30000}" type="currency"
                                                currencySymbol="đ"/></span>
                    </div>
                    <div class="d-flex justify-content-between mb-2">
                        <span>Phí vận chuyển:</span>
                        <span>30,000đ</span>
                    </div>
                    <hr>
                    <div class="d-flex justify-content-between font-weight-bold">
                        <span class="h5">Tổng cộng:</span>
                        <span class="h5 text-danger"><fmt:formatNumber value="${order.totalPrice}" type="currency"
                                                                       currencySymbol="đ"/></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-footer bg-white">
            <a href="/history" class="btn btn-outline-primary">Quay lại lịch sử</a>
        </div>
    </div>
</div>
