<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div class="col-xl-6">
    <div class="single-carousel owl-carousel">
        <div class="single-item"
             data-dot="<img class='img-fluid' src='/images/product/${product.image}' alt=''>">
            <div class="single-inner bg-light rounded">
                <img src="/images/product/${product.image}" class="img-fluid rounded" alt="Image">
            </div>
        </div>
        <div class="single-item"
             data-dot="<img class='img-fluid' src='/images/product/${product.image}' alt=''>">
            <div class="single-inner bg-light rounded">
                <img src="/images/product/${product.image}" class="img-fluid rounded" alt="Image">
            </div>
        </div>
        <div class="single-item"
             data-dot="<img class='img-fluid' src='/images/product/${product.image}' alt=''>">
            <div class="single-inner bg-light rounded">
                <img src="/images/product/${product.image}" class="img-fluid rounded" alt="Image">
            </div>
        </div>
        <div class="single-item"
             data-dot="<img class='img-fluid' src='/images/product/${product.image}' alt=''>">
            <div class="single-inner bg-light rounded">
                <img src="/images/product/${product.image}" class="img-fluid rounded" alt="Image">
            </div>
        </div>
        <div class="single-item"
             data-dot="<img class='img-fluid' src='/images/product/${product.image}' alt=''>">
            <div class="single-inner bg-light rounded">
                <img src="/images/product/${product.image}" class="img-fluid rounded" alt="Image">
            </div>
        </div>
    </div>
</div>
<div class="col-xl-6">
    <h4 class="fw-bold mb-3">${product.name}</h4>
    <p class="mb-3">Loại máy: Laptop ${product.target}</p>
    <h5 class="fw-bold mb-3">
        <fmt:formatNumber value="${product.price}" pattern="#,### ₫"/>
    </h5>
    <div class="d-flex mb-4">
        <i class="fa fa-star text-secondary"></i>
        <i class="fa fa-star text-secondary"></i>
        <i class="fa fa-star text-secondary"></i>
        <i class="fa fa-star text-secondary"></i>
        <i class="fa fa-star"></i>
    </div>
    <div class="mb-3">
        <div class="btn btn-primary d-inline-block rounded text-white py-1 px-4 me-2"><i
                class="fab fa-facebook-f me-1"></i> Share
        </div>
        <div class="btn btn-secondary d-inline-block rounded text-white py-1 px-4 ms-2"><i
                class="fab fa-twitter ms-1"></i> Share
        </div>
    </div>
    <div class="d-flex flex-column mb-3">
        <small>Product SKU: N/A</small>
        <small>Số lượng có sẵn: <strong class="text-primary">${product.quantity} sản phẩm</strong></small>
    </div>
    <p class="mb-4">${product.shortDesc}</p>
    <form action="/cart" method="post">
        <div class="input-group quantity mb-5" style="width: 100px;">
            <div class="input-group-btn">
                <button class="btn btn-sm btn-minus-detail rounded-circle bg-light border" type="button">
                    <i class="fa fa-minus"></i>
                </button>
            </div>
            <input name="quantity" type="text"
                   class="cart-detail-quantity form-control form-control-sm text-center border-0"
                   value="1"
                   data-value="1"
                   data-max="${product.quantity}"
            >
            <div class="input-group-btn">
                <button class="btn btn-sm btn-plus-detail rounded-circle bg-light border" type="button">
                    <i class="fa fa-plus"></i>
                </button>
            </div>
            <input type="text" name="userId" hidden value="${sessionScope.userId}">
            <input type="text" name="productId" hidden value="${product.id}">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </div>

        <c:choose>
            <c:when test="${not empty sessionScope.fullName}">
                <button type="submit"
                        class="btn btn-primary border border-secondary rounded-pill px-4 py-2 mb-4 text-primary">
                    <i class="fa fa-shopping-bag me-2 text-white"></i>
                    Thêm vào giỏ hàng
                </button>
            </c:when>
            <c:otherwise>
                <a href="/login"
                   class="btn btn-outline-secondary border border-secondary rounded-pill px-4 py-2 mb-4">
                    <i class="fa fa-user me-2"></i>
                    Đăng nhập để mua hàng
                </a>
            </c:otherwise>
        </c:choose>
    </form>
</div>

<div class="col-lg-12">
    <nav>
        <div class="nav nav-tabs mb-3">
            <button class="nav-link active border-white border-bottom-0" type="button"
                    role="tab" id="nav-about-tab" data-bs-toggle="tab" data-bs-target="#nav-about"
                    aria-controls="nav-about" aria-selected="true">Mô tả
            </button>
            <button class="nav-link border-white border-bottom-0" type="button" role="tab"
                    id="nav-mission-tab" data-bs-toggle="tab" data-bs-target="#nav-mission"
                    aria-controls="nav-mission" aria-selected="false">Đánh giá
            </button>
        </div>
    </nav>
    <div class="tab-content mb-5">
        <div class="tab-pane active" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
            <p class="text-dark">${product.detailDesc}</p>
        </div>

        <div class="tab-pane" id="nav-mission" role="tabpanel" aria-labelledby="nav-mission-tab">
            <div class="d-flex mb-4">
                <img src="/images/client/img/avatar.jpg" class="img-fluid rounded-circle p-2"
                     style="width: 80px; height: 80px; object-fit: cover;" alt="User Avatar">
                <div class="ms-3">
                    <p class="mb-1" style="font-size: 13px; color: #777;">20 Tháng 2, 2025</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <h5 class="mb-1">Nguyễn Văn A</h5>
                        <div class="d-flex text-secondary ms-3">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                    </div>
                    <p class="text-dark mt-2">Sản phẩm dùng rất tốt, đóng gói cẩn thận. Shop tư vấn nhiệt tình, sẽ tiếp tục ủng hộ lần sau!</p>
                </div>
            </div>

            <hr class="my-4" style="border-top: 1px solid #eee;">

            <div class="d-flex mb-4">
                <img src="/images/client/img/avatar.jpg" class="img-fluid rounded-circle p-2"
                     style="width: 80px; height: 80px; object-fit: cover;" alt="User Avatar">
                <div class="ms-3">
                    <p class="mb-1" style="font-size: 13px; color: #777;">15 Tháng 2, 2025</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <h5 class="mb-1">Trần Thị B</h5>
                        <div class="d-flex text-secondary ms-3">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="far fa-star"></i> </div>
                    </div>
                    <p class="text-dark mt-2">Máy chạy mượt, tuy nhiên pin hơi nhanh sụt một chút. Với tầm giá này thì hoàn toàn xứng đáng.</p>
                </div>
            </div>
        </div>

        <div class="tab-pane" id="nav-vision" role="tabpanel">
            <div class="p-3">
                <p class="text-dark font-weight-bold">Thông tin bổ sung về sản phẩm:</p>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">Chính sách bảo hành: 12 tháng tại hãng.</li>
                    <li class="list-group-item">Giao hàng: Miễn phí trong nội thành Hà Nội.</li>
                    <li class="list-group-item">Đổi trả: Trong vòng 7 ngày nếu có lỗi phần cứng.</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<form action="#">
    <h4 class="mb-5 fw-bold">Để lại câu hỏi</h4>
    <div class="row g-4">
        <div class="col-lg-6">
            <div class="border-bottom rounded">
                <input type="text" class="form-control border-0 me-4" placeholder="Tên của bạn *">
            </div>
        </div>
        <div class="col-lg-6">
            <div class="border-bottom rounded">
                <input type="email" class="form-control border-0" placeholder="Email *">
            </div>
        </div>
        <div class="col-lg-12">
            <div class="border-bottom rounded my-4">
                                        <textarea name="" id="" class="form-control border-0" cols="30" rows="8"
                                                  placeholder="Câu hỏi của bạn *" spellcheck="false"></textarea>
            </div>
        </div>
        <div class="col-lg-12">
            <div class="d-flex justify-content-between py-3 mb-5">
                <div class="d-flex align-items-center">
                    <p class="mb-0 me-3">Đánh giá:</p>
                    <div class="d-flex align-items-center" style="font-size: 12px;">
                        <i class="fa fa-star text-muted"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                    </div>
                </div>
                <button disabled
                        class="btn btn-primary border border-secondary text-primary rounded-pill px-4 py-3">
                    Đăng câu hỏi
                </button>
            </div>
        </div>
    </div>
</form>

<script>
    const btnMinus = document.querySelector(".btn-minus-detail");
    const btnPlus = document.querySelector(".btn-plus-detail");
    const inputQuantity = document.querySelector(".cart-detail-quantity");

    btnMinus.addEventListener("click", () => {
        let inputVal = Number(inputQuantity.dataset.value);
        if (inputVal > 1) {
            inputVal--;
            inputQuantity.dataset.value = String(inputVal);
            inputQuantity.value = inputVal;
        }
    })

    btnPlus.addEventListener("click", () => {
        let inputVal = Number(inputQuantity.dataset.value);
        let maxQuantity = Number(inputQuantity.dataset.max);
        if (inputVal < maxQuantity) {
            inputVal++;
            inputQuantity.dataset.value = String(inputVal);
            inputQuantity.value = inputVal;
        }
    })
</script>
