<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Banner start -->
<c:set var="breadcrumb" value="${{'lev1t':'Trang chủ','lev1l':'/', 'lev2t': 'Sản phẩm'}}"
       scope="request"/>
<c:set var="bannerTitle" value="${'Sản phẩm của chúng tôi'}"
       scope="request"/>
<jsp:include page="/WEB-INF/view/client/component/common/banner.jsp"/>
<!-- Banner end -->

<%-- Service start --%>
<jsp:include page="/WEB-INF/view/client/component/common/service.jsp"/>
<%-- Service end --%>

<%-- Product offer start --%>
<jsp:include page="/WEB-INF/view/client/component/common/productOffer.jsp"/>
<%-- Product offer end --%>

<!-- Shop Page Start -->
<div class="container-fluid shop py-5">
    <div class="container py-5">
        <div class="row g-4">
            <!-- Filter start -->
            <div class="col-lg-3 wow fadeInUp" data-wow-delay="0.1s">
                <jsp:include page="/WEB-INF/view/client/component/common/filter.jsp"/>
            </div>
            <!-- Filter end -->

            <!-- Product List Start -->
            <div class="col-lg-9 wow fadeInUp" data-wow-delay="0.1s">
                <div class="rounded mb-4 position-relative">
                    <img src="/images/client/img/product-banner-3.jpg" class="img-fluid rounded w-100" style="height:
                    250px;"
                         alt="Image">
                    <div class="position-absolute rounded d-flex flex-column align-items-center justify-content-center text-center"
                         style="width: 100%; height: 250px; top: 0; left: 0; background: rgba(242, 139, 0, 0.3);">
                        <h4 class="display-5 text-primary">SALE</h4>
                        <h3 class="display-4 text-white mb-4">Get UP To 50% Off</h3>
                        <a href="#" class="btn btn-primary rounded-pill">Shop Now</a>
                    </div>
                </div>
                <div class="row g-4">
                    <div class="col-xl-7">
                        <div class="input-group w-100 mx-auto d-flex">
                            <input type="search" class="form-control p-3" placeholder="keywords"
                                   aria-describedby="search-icon-1">
                            <span id="search-icon-1" class="input-group-text p-3"><i
                                    class="fa fa-search"></i></span>
                        </div>
                    </div>
                    <div class="col-xl-3 text-end">
                        <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between">
                            <label for="electronics">Sort By:</label>
                            <select id="electronics" name="electronicslist"
                                    class="border-0 form-select-sm bg-light me-3" form="electronicsform">
                                <option value="volvo">Default Sorting</option>
                                <option value="volv">Nothing</option>
                                <option value="sab">Popularity</option>
                                <option value="saab">Newness</option>
                                <option value="opel">Average Rating</option>
                                <option value="audio">Low to high</option>
                                <option value="audi">High to low</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-4 col-xl-2">
                        <ul class="nav nav-pills d-inline-flex text-center py-2 px-2 rounded bg-light mb-4">
                            <li class="nav-item me-4">
                                <a class="bg-light" data-bs-toggle="pill" href="#tab-5">
                                    <i class="fas fa-th fa-3x text-primary"></i>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="bg-light" data-bs-toggle="pill" href="#tab-6">
                                    <i class="fas fa-bars fa-3x text-primary"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="tab-content">
                    <div id="tab-5" class="tab-pane fade show p-0 active">
                        <div class="row g-4 product">
                            <!-- vertical product card start -->
                            <c:forEach items="${productList}" var="item">
                                <div class="col-lg-4">
                                    <c:set var="product" value="${item}" scope="request"/>
                                    <jsp:include page="/WEB-INF/view/client/component/common/verticalProductCard.jsp"/>
                                </div>
                            </c:forEach>
                            <!-- vertical product card end -->

                            <!-- pagination start -->
                            <jsp:include page="/WEB-INF/view/client/component/common/pagination.jsp"/>
                            <!-- pagination end -->
                        </div>
                    </div>
                    <div id="tab-6" class="products tab-pane fade show p-0">
                        <div class="row g-4 products-mini">
                            <!-- Horizontal card start -->
                            <c:forEach items="${productList}" var="item">
                                <div class="col-lg-6">
                                    <c:set var="product" value="${item}" scope="request"/>
                                    <jsp:include
                                            page="/WEB-INF/view/client/component/common/horizontalProductCard.jsp"/>
                                </div>
                            </c:forEach>
                            <!-- Horizontal card end -->

                            <!-- Pagination start -->
                            <jsp:include page="/WEB-INF/view/client/component/common/pagination.jsp"/>
                            <!-- Pagination end -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- Product List End -->
        </div>
    </div>
</div>
<!-- Shop Page End -->

<%-- Product Banner Start --%>
<jsp:include page="/WEB-INF/view/client/component/common/productBanner.jsp"/>
<%-- Product Banner End --%>