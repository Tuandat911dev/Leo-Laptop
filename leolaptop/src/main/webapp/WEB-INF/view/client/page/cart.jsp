<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Banner start -->
<c:set var="breadcrumb" value="${{'lev1t':'Trang chủ','lev1l':'/', 'lev2t': 'Giỏ hàng'}}"
       scope="request"/>
<c:set var="bannerTitle" value="${'Giỏ hàng'}"
       scope="request"/>
<jsp:include page="/WEB-INF/view/client/component/common/banner.jsp"/>
<!-- Banner end -->

<!-- Cart Start -->
<div class="container-fluid py-5">
    <div class="container py-5">
        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Sản Phẩm</th>
                    <th scope="col">Giá</th>
                    <th scope="col">Số Lượng</th>
                    <th scope="col">Tổng</th>
                    <th scope="col">Xoá</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${cartList}" var="item">
                    <tr>
                        <th scope="row">
                            <div class="d-flex align-items-center" style="gap: 30px">
                                <img style="width: 80px; height: 80px; border-radius: 5px; object-fit: cover; border: 1px
                        solid #ccc"
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
                            <div class="input-group quantity py-4" style="width: 100px;">
                                <div class="input-group-btn">
                                    <button class="btn btn-sm btn-minus rounded-circle bg-light border">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                                <input type="number"
                                       class="form-control form-control-sm text-center border-0 cart-quantity"
                                       value="${item.quantity}"
                                       min="1"
                                       data-product-id="${item.productId}"
                                       data-price="${item.productPrice}">
                                <div class="input-group-btn">
                                    <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                        <i class="fa fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                        </td>
                        <td>
                            <p class="mb-0 py-4 cart-totalPrice" data-product-id="${item.productId}">
                                <fmt:formatNumber value="${item.totalPrice}" pattern="#,### ₫"/>
                            </p>
                        </td>
                        <td class="py-4">
                            <button class="btn btn-md rounded-circle bg-light border">
                                <i class="fa fa-times text-danger"></i>
                            </button>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>

        <div class="row g-4 justify-content-end">
            <div class="col-8"></div>
            <div class="col-sm-8 col-md-7 col-lg-6 col-xl-4">
                <div class="bg-light rounded">
                    <div class="p-4">
                        <h1 class="display-6 mb-4">Cart <span class="fw-normal">Total</span></h1>
                        <div class="d-flex justify-content-between mb-4">
                            <h5 class="mb-0 me-4">Subtotal:</h5>
                            <p class="mb-0">$96.00</p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h5 class="mb-0 me-4">Shipping</h5>
                            <div>
                                <p class="mb-0">Flat rate: $3.00</p>
                            </div>
                        </div>
                        <p class="mb-0 text-end">Shipping to Ukraine.</p>
                    </div>
                    <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                        <h5 class="mb-0 ps-4 me-4">Total</h5>
                        <p class="mb-0 pe-4">$99.00</p>
                    </div>
                    <button class="btn btn-primary rounded-pill px-4 py-3 text-uppercase mb-4 ms-4"
                            type="button">Proceed Checkout
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Cart End -->
