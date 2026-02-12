<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<!-- Banner start -->
<c:set var="breadcrumb" value="${{'lev1t':'Trang chủ','lev1l':'/', 'lev2t': 'Thanh toán'}}"
       scope="request"/>
<c:set var="bannerTitle" value="${'Thanh Toán'}"
       scope="request"/>
<jsp:include page="/WEB-INF/view/client/component/common/banner.jsp"/>
<!-- Banner end -->

<!-- Services Start -->
<jsp:include page="/WEB-INF/view/client/component/common/service.jsp"/>
<!-- Services End -->

<!-- Checkout Page Start -->
<div class="container-fluid bg-light overflow-hidden py-5">
    <div class="container py-5">
        <h1 class="mb-4 wow fadeInUp" data-wow-delay="0.1s">Thông tin người nhận</h1>
        <form action="/order" method="post">
            <div class="row g-5">
                <div class="col-md-12 col-lg-6 col-xl-6 wow fadeInUp" data-wow-delay="0.1s">

                    <div class="form-item">
                        <label class="form-label my-3">Tên người nhận <sup>*</sup></label>
                        <input type="text" class="form-control">
                    </div>
                    <div class="form-item">
                        <label class="form-label my-3">Địa chỉ nhận hàng <sup>*</sup></label>
                        <input type="text" class="form-control" placeholder="House Number Street Name">
                    </div>
                    <div class="form-item">
                        <label class="form-label my-3">Điện thoại <sup>*</sup></label>
                        <input type="text" class="form-control">
                    </div>
                    <hr>
                    <div class="form-item">
                        <label class="form-label my-3">Lưu ý cho cửa hàng <sup>*</sup></label>
                        <textarea name="text" class="form-control" spellcheck="false" cols="30" rows="11"></textarea>
                    </div>
                </div>
                <div class="col-md-12 col-lg-6 col-xl-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">Sản Phẩm</th>
                                <th scope="col">Giá</th>
                                <th scope="col">Số Lượng</th>
                                <th scope="col">Tổng</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach items="${cartList}" var="item">
                                <tr>
                                    <th scope="row">
                                        <div class="d-flex align-items-center" style="gap: 15px">
                                            <img style="width: 60px; height: 60px; border-radius: 5px; object-fit:
                                            cover; border: 1px solid #ccc"
                                                 src="/images/product/${item.productImg}" alt="">
                                            <p class="mb-0 py-4">${item.productName}</p>
                                        </div>

                                    </th>

                                    <td>
                                        <p class="mb-0 py-4">
                                            <fmt:formatNumber value="${item.productPrice}" pattern="#,### ₫"/>
                                        </p>
                                    </td>
                                    <td>
                                        <p class="mb-0 py-4">
                                                ${item.quantity}
                                        </p>
                                    </td>
                                    <td>
                                        <p class="mb-0 py-4 cart-totalPrice" data-product-id="${item.productId}">
                                            <fmt:formatNumber value="${item.totalPrice}" pattern="#,### ₫"/>
                                        </p>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                    <div class="row g-0 align-items-center border-bottom py-3">
                        <div class="col-12">
                            <div class="form-check d-flex align-items-center">
                                <input type="radio" class="form-check-input bg-primary border-0" id="cod"
                                       name="paymentMethod" value="COD" checked style="cursor: pointer">
                                <label class="form-check-label d-flex align-items-center ms-3" for="cod">
                                    <img src="/images/payment/cod.png" alt="COD" style="width: 40px; height: 40px;
                                    object-fit: contain; border-radius: 5px" class="me-3">
                                    <span>Thanh toán khi nhận hàng (COD)</span>
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="row g-0 align-items-center border-bottom py-3">
                        <div class="col-12">
                            <div class="form-check d-flex align-items-center">
                                <input type="radio" class="form-check-input bg-primary border-0" id="vnpay"
                                       name="paymentMethod" value="VNPAY" style="cursor: pointer">
                                <label class="form-check-label d-flex align-items-center ms-3" for="vnpay">
                                    <img src="/images/payment/vnpay.jpg" alt="VNPAY" style="width: 40px; height: 40px;
                                    object-fit: contain; border-radius: 5px" class="me-3">
                                    <span>Ví điện tử VNPAY</span>
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="row g-0 align-items-center border-bottom py-3">
                        <div class="col-12">
                            <div class="form-check d-flex align-items-center">
                                <input type="radio" class="form-check-input bg-primary border-0" id="momo"
                                       name="paymentMethod" value="MOMO" style="cursor: pointer">
                                <label class="form-check-label d-flex align-items-center ms-3" for="momo">
                                    <img src="/images/payment/momo.png" alt="MOMO" style="width: 40px; height: 40px;
                                    object-fit: contain; border-radius: 5px" class="me-3">
                                    <span>Ví điện tử MoMo</span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row g-4 text-center align-items-center justify-content-center pt-4">
                        <button type="button"
                                class="btn btn-primary border-secondary py-3 px-4 text-uppercase w-100 text-primary">
                            Đặt hàng
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- Checkout Page End -->



