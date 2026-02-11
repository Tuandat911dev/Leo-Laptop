<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
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
                            <div class="input-group quantity py-4" style="width: 125px;">
                                <div class="input-group-btn">
                                    <button class="btn btn-sm btn-minus rounded-circle bg-light border">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                                <input type="number"
                                       class="form-control form-control-sm text-center border-0 cart-quantity"
                                       value="${item.quantity}"
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
                        <h1 class="display-6 mb-4"><span class="fw-normal">Đơn Hàng</span></h1>
                        <div class="d-flex justify-content-between mb-4">
                            <h5 class="mb-0 me-4">Tiền hàng:</h5>
                            <p class="mb-0 cart-subtotal">0đ</p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h5 class="mb-0 me-4">Phí vận chuyển</h5>
                            <div>
                                <p class="mb-0">30.000đ</p>
                            </div>
                        </div>
                    </div>
                    <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                        <h5 class="mb-0 ps-4 me-4">Tổng cộng</h5>
                        <p class="mb-0 pe-4 cart-total">0đ</p>
                    </div>
                    <button class="btn btn-primary rounded-pill px-4 py-3 text-uppercase mb-4 ms-4"
                            type="button">Thanh Toán
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Cart End -->

<script>
    const formatter = new Intl.NumberFormat('vi-VN', {
        style: 'currency',
        currency: 'VND'
    });

    function updateRowTotal(input) {
        const price = Number(input.dataset.price);
        const quantity = Number(input.value);
        const row = input.closest("tr");
        const totalEl = row.querySelector(".cart-totalPrice");

        const total = price * quantity;

        totalEl.dataset.total = total;

        totalEl.textContent = formatter.format(total);
    }

    function updateBill() {
        let subtotal = 0;

        document.querySelectorAll(".cart-totalPrice").forEach(item => {
            subtotal += Number(item.dataset.total || 0);
        });

        const shipping = 30000;
        const total = subtotal + shipping;

        document.querySelector(".cart-subtotal").textContent = formatter.format(subtotal);
        document.querySelector(".cart-total").textContent = formatter.format(total);
    }

    function handleQuantityChange(input) {
        if (input.value < 1) input.value = 1;

        updateRowTotal(input);
        updateBill();
    }

    document.querySelectorAll(".cart-quantity").forEach(input => {

        input.addEventListener("input", () => {
            handleQuantityChange(input);
        });

        input.closest("tr").querySelector(".btn-plus")
            .addEventListener("click", () => {
                input.value++;
                handleQuantityChange(input);
            });

        input.closest("tr").querySelector(".btn-minus")
            .addEventListener("click", () => {
                if (input.value > 1) {
                    input.value--;
                    handleQuantityChange(input);
                }
            });
    });

    document.querySelectorAll(".cart-quantity").forEach(input => {
        updateRowTotal(input);
    });
    updateBill();
</script>


