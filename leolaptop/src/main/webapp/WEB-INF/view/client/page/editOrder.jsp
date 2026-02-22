<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow">
                <div class="card-header bg-primary text-white font-weight-bold">
                    Cập nhật thông tin giao hàng #ORD-${order.id}
                </div>
                <div class="card-body">
                    <form:form action="/history/edit/${order.id}" method="post" modelAttribute="order">
                        <div class="form-group mb-3">
                            <label><b>Tên người nhận</b></label>
                            <spring:bind path="order.receiverName">
                                <form:input path="receiverName"
                                            class="form-control ${status.error ? 'is-invalid' : ''}"
                                            placeholder="Nhập đầy đủ họ tên" />
                                <form:errors path="receiverName" cssClass="invalid-feedback" />
                            </spring:bind>
                        </div>

                        <div class="form-group mb-3">
                            <label><b>Số điện thoại</b></label>
                            <spring:bind path="order.receiverPhone">
                                <form:input path="receiverPhone"
                                            class="form-control ${status.error ? 'is-invalid' : ''}"
                                            placeholder="Ví dụ: 0912345678" />
                                <form:errors path="receiverPhone" cssClass="invalid-feedback" />
                            </spring:bind>
                        </div>

                        <div class="form-group mb-3">
                            <label><b>Địa chỉ nhận hàng</b></label>
                            <spring:bind path="order.receiverAddress">
                                <form:textarea path="receiverAddress"
                                            class="form-control ${status.error ? 'is-invalid' : ''}"
                                            placeholder="Số nhà, tên đường, phường/xã..." rows="3" />
                                <form:errors path="receiverAddress" cssClass="invalid-feedback" />
                            </spring:bind>
                        </div>

                        <div class="form-group mb-3">
                            <label><b>Ghi chú (nếu có)</b></label>
                            <form:textarea path="orderNotes" class="form-control" rows="2"/>
                        </div>

                        <div class="alert alert-info small mb-3">
                            <i class="fas fa-info-circle"></i> Bạn chỉ có thể cập nhật thông tin khi đơn hàng chưa được
                            giao.
                        </div>

                        <div class="d-flex justify-content-between">
                            <a href="/history" class="btn btn-secondary">Hủy bỏ</a>
                            <button type="submit" class="btn btn-success">Lưu thay đổi</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>