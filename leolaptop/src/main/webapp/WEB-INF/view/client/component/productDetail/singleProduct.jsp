<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <div class="input-group quantity mb-5" style="width: 100px;">
        <div class="input-group-btn">
            <button class="btn btn-sm btn-minus rounded-circle bg-light border">
                <i class="fa fa-minus"></i>
            </button>
        </div>
        <input type="text" class="form-control form-control-sm text-center border-0" value="1">
        <div class="input-group-btn">
            <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                <i class="fa fa-plus"></i>
            </button>
        </div>
    </div>
    <a href="#"
       class="btn btn-primary border border-secondary rounded-pill px-4 py-2 mb-4 text-primary"><i
            class="fa fa-shopping-bag me-2 text-white"></i> Add to cart</a>
</div>
<div class="col-lg-12">
    <nav>
        <div class="nav nav-tabs mb-3">
            <button class="nav-link active border-white border-bottom-0" type="button"
                    role="tab" id="nav-about-tab" data-bs-toggle="tab" data-bs-target="#nav-about"
                    aria-controls="nav-about" aria-selected="true">Description
            </button>
            <button class="nav-link border-white border-bottom-0" type="button" role="tab"
                    id="nav-mission-tab" data-bs-toggle="tab" data-bs-target="#nav-mission"
                    aria-controls="nav-mission" aria-selected="false">Reviews
            </button>
        </div>
    </nav>
    <div class="tab-content mb-5">
        <div class="tab-pane active" id="nav-about" role="tabpanel"
             aria-labelledby="nav-about-tab">
            <p>${product.detailDesc}
            </p>
        </div>
        <div class="tab-pane" id="nav-mission" role="tabpanel"
             aria-labelledby="nav-mission-tab">
            <div class="d-flex">
                <img src="/images/client/img/avatar.jpg" class="img-fluid rounded-circle p-3"
                     style="width: 100px; height: 100px;" alt="">
                <div class="">
                    <p class="mb-2" style="font-size: 14px;">April 12, 2024</p>
                    <div class="d-flex justify-content-between">
                        <h5>Jason Smith</h5>
                        <div class="d-flex mb-3">
                            <i class="fa fa-star text-secondary"></i>
                            <i class="fa fa-star text-secondary"></i>
                            <i class="fa fa-star text-secondary"></i>
                            <i class="fa fa-star text-secondary"></i>
                            <i class="fa fa-star"></i>
                        </div>
                    </div>
                    <p>The generated Lorem Ipsum is therefore always free from repetition
                        injected humour, or non-characteristic
                        words etc. Susp endisse ultricies nisi vel quam suscipit </p>
                </div>
            </div>
            <div class="d-flex">
                <img src="/images/client/img/avatar.jpg" class="img-fluid rounded-circle p-3"
                     style="width: 100px; height: 100px;" alt="">
                <div class="">
                    <p class="mb-2" style="font-size: 14px;">April 12, 2024</p>
                    <div class="d-flex justify-content-between">
                        <h5>Sam Peters</h5>
                        <div class="d-flex mb-3">
                            <i class="fa fa-star text-secondary"></i>
                            <i class="fa fa-star text-secondary"></i>
                            <i class="fa fa-star text-secondary"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                    </div>
                    <p class="text-dark">The generated Lorem Ipsum is therefore always free from
                        repetition injected humour, or non-characteristic
                        words etc. Susp endisse ultricies nisi vel quam suscipit </p>
                </div>
            </div>
        </div>
        <div class="tab-pane" id="nav-vision" role="tabpanel">
            <p class="text-dark">Tempor erat elitr rebum at clita. Diam dolor diam ipsum et
                tempor sit. Aliqu diam
                amet diam et eos labore. 3</p>
            <p class="mb-0">Diam dolor diam ipsum et tempor sit. Aliqu diam amet diam et eos
                labore.
                Clita erat ipsum et lorem et sit</p>
        </div>
    </div>
</div>
<form action="#">
    <h4 class="mb-5 fw-bold">Leave a Reply</h4>
    <div class="row g-4">
        <div class="col-lg-6">
            <div class="border-bottom rounded">
                <input type="text" class="form-control border-0 me-4" placeholder="Yur Name *">
            </div>
        </div>
        <div class="col-lg-6">
            <div class="border-bottom rounded">
                <input type="email" class="form-control border-0" placeholder="Your Email *">
            </div>
        </div>
        <div class="col-lg-12">
            <div class="border-bottom rounded my-4">
                                        <textarea name="" id="" class="form-control border-0" cols="30" rows="8"
                                                  placeholder="Your Review *" spellcheck="false"></textarea>
            </div>
        </div>
        <div class="col-lg-12">
            <div class="d-flex justify-content-between py-3 mb-5">
                <div class="d-flex align-items-center">
                    <p class="mb-0 me-3">Please rate:</p>
                    <div class="d-flex align-items-center" style="font-size: 12px;">
                        <i class="fa fa-star text-muted"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                    </div>
                </div>
                <a href="#"
                   class="btn btn-primary border border-secondary text-primary rounded-pill px-4 py-3">
                    Post Comment</a>
            </div>
        </div>
    </div>
</form>
