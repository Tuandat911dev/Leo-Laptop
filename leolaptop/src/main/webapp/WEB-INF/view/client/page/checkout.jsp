<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:set var="breadcrumb" value="${{'lev1t':'Trang chủ','lev1l':'/', 'lev2t': 'Thanh toán'}}" scope="request"/>
<c:set var="bannerTitle" value="${'Thanh Toán'}" scope="request"/>
<jsp:include page="/WEB-INF/view/client/component/common/banner.jsp"/>
<div class="container-fluid bg-light overflow-hidden py-5">
    <div class="container py-5">
        <h1 class="mb-4 wow fadeInUp" data-wow-delay="0.1s">Thông tin thanh toán</h1>

        <form:form action="/checkout" method="post" modelAttribute="newOrder">
            <div class="row g-5">
                <div class="col-md-12 col-lg-6 col-xl-7 wow fadeInUp" data-wow-delay="0.1s">

                    <div class="form-item">
                        <label class="form-label my-3">Tên người nhận <sup>*</sup></label>
                        <spring:bind path="newOrder.receiverName">
                            <form:input path="receiverName"
                                        class="form-control ${status.error ? 'is-invalid' : ''}"
                                        placeholder="Nhập đầy đủ họ tên" />
                            <form:errors path="receiverName" cssClass="invalid-feedback" />
                        </spring:bind>
                    </div>

                    <div class="form-item">
                        <label class="form-label my-3">Địa chỉ nhận hàng <sup>*</sup></label>
                        <spring:bind path="newOrder.receiverAddress">
                            <form:input path="receiverAddress"
                                        class="form-control ${status.error ? 'is-invalid' : ''}"
                                        placeholder="Số nhà, tên đường, phường/xã..." />
                            <form:errors path="receiverAddress" cssClass="invalid-feedback" />
                        </spring:bind>
                    </div>

                    <div class="form-item">
                        <label class="form-label my-3">Điện thoại <sup>*</sup></label>
                        <spring:bind path="newOrder.receiverPhone">
                            <form:input path="receiverPhone"
                                        class="form-control ${status.error ? 'is-invalid' : ''}"
                                        placeholder="Ví dụ: 0912345678" />
                            <form:errors path="receiverPhone" cssClass="invalid-feedback" />
                        </spring:bind>
                    </div>

                    <div class="form-item mt-3">
                        <label class="form-label my-3">Lưu ý cho cửa hàng (tùy chọn)</label>
                        <form:textarea path="orderNotes" class="form-control"
                                       placeholder="Ghi chú về thời gian giao hàng hoặc chỉ dẫn đường đi..."
                                       spellcheck="false" cols="30" rows="8" />
                    </div>
                </div>

                <div class="col-md-12 col-lg-6 col-xl-5 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="table-responsive">
                        <table class="table border-bottom">
                            <thead>
                            <tr>
                                <th scope="col">Sản phẩm</th>
                                <th scope="col">Giá</th>
                                <th scope="col">SL</th>
                                <th scope="col">Tổng</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${cartList}" var="item">
                                <tr>
                                    <th scope="row">
                                        <div class="d-flex align-items-center" style="gap: 10px">
                                            <img src="/images/product/${item.productImg}"
                                                 style="width: 50px; height: 50px; object-fit: cover; border-radius: 5px;"
                                                 alt="${item.productName}">
                                            <p class="mb-0 small text-truncate" style="max-width: 120px;">${item.productName}</p>
                                        </div>
                                    </th>
                                    <td>
                                        <p class="mb-0 mt-2 small">
                                            <fmt:formatNumber value="${item.productPrice}" pattern="#,### ₫"/>
                                        </p>
                                    </td>
                                    <td>
                                        <p class="mb-0 mt-2 small">${item.quantity}</p>
                                    </td>
                                    <td>
                                        <p class="mb-0 mt-2 small fw-bold checkout-total-price"
                                           data-price="${item.totalPrice}">
                                            <fmt:formatNumber value="${item.totalPrice}" pattern="#,### ₫"/>
                                        </p>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="3" class="text-end py-3 fw-bold">Phí giao hàng:</td>
                                <td class="py-3 text-primary fw-bold">
                                    30.000 ₫
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" class="text-end py-3 fw-bold">Tổng cộng:</td>
                                <td class="py-3 text-primary fw-bold checkout-total-bill">
                                </td>
                            </tr>
                            </tfoot>
                        </table>
                    </div>

                    <div class="mt-4">
                        <h5 class="mb-3">Phương thức thanh toán</h5>
                        <spring:bind path="newOrder.paymentMethod">
                            <div class="rounded p-3 border ${status.error ? 'border-danger' : ''}" style="background-color: #f8f9fa;">

                                <div class="form-check d-flex align-items-center mb-3">
                                    <form:radiobutton path="paymentMethod" value="COD" id="method_cod" class="form-check-input" checked="checked"/>
                                    <label class="form-check-label ms-3 d-flex align-items-center" for="method_cod" style="cursor: pointer">
                                        <img src="/images/payment/cod.png" class="me-2" style="width: 30px" alt="COD">
                                        Tiền mặt (COD)
                                    </label>
                                </div>

                                <div class="form-check d-flex align-items-center mb-3">
                                    <form:radiobutton path="paymentMethod" value="VNPAY" id="method_vnpay" class="form-check-input" />
                                    <label class="form-check-label ms-3 d-flex align-items-center" for="method_vnpay" style="cursor: pointer">
                                        <img src="/images/payment/vnpay.jpg" class="me-2" style="width: 30px" alt="VNPAY">
                                        VNPAY
                                    </label>
                                </div>

                                <div class="form-check d-flex align-items-center">
                                    <form:radiobutton path="paymentMethod" value="MOMO" id="method_momo" class="form-check-input" />
                                    <label class="form-check-label ms-3 d-flex align-items-center" for="method_momo" style="cursor: pointer">
                                        <img src="/images/payment/momo.png" class="me-2" style="width: 30px" alt="MoMo">
                                        Ví MoMo
                                    </label>
                                </div>

                                <form:errors path="paymentMethod" cssClass="text-danger small mt-2 d-block" />
                            </div>
                        </spring:bind>
                    </div>

                    <button type="submit" class="btn btn-primary border-0 py-3 px-4 text-uppercase w-100 mt-4 text-white fw-bold">
                        Xác nhận đặt hàng
                    </button>
                </div>
            </div>
        </form:form>
    </div>
</div>

<script>
    const formatter = new Intl.NumberFormat('vi-VN', {
        style: 'currency',
        currency: 'VND'
    });

    const calculateTotalBill = () => {
        let subTotal = 30000;
        document.querySelectorAll(".checkout-total-price").forEach(item => {
            subTotal += Number(item.dataset.price || 0);
        });

        document.querySelector(".checkout-total-bill").textContent = formatter.format(subTotal);
    }

    calculateTotalBill();
</script>