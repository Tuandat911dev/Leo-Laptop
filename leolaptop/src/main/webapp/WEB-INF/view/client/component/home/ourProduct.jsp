<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid product py-5">
    <div class="container py-5">
        <div class="tab-class">
            <div class="row g-4">
                <div class="col-lg-4 text-start wow fadeInLeft" data-wow-delay="0.1s">
                    <h1>Our Products</h1>
                </div>
                <div class="col-lg-8 text-end wow fadeInRight" data-wow-delay="0.1s">
                    <ul class="nav nav-pills d-inline-flex text-center mb-5">
                        <li class="nav-item mb-4">
                            <a class="d-flex mx-2 py-2 bg-light rounded-pill active" data-bs-toggle="pill"
                               href="#tab-1">
                                <span class="text-dark" style="width: 130px;">All Products</span>
                            </a>
                        </li>
                        <li class="nav-item mb-4">
                            <a class="d-flex py-2 mx-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-2">
                                <span class="text-dark" style="width: 130px;">New Arrivals</span>
                            </a>
                        </li>
                        <li class="nav-item mb-4">
                            <a class="d-flex mx-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-3">
                                <span class="text-dark" style="width: 130px;">Featured</span>
                            </a>
                        </li>
                        <li class="nav-item mb-4">
                            <a class="d-flex mx-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-4">
                                <span class="text-dark" style="width: 130px;">Top Selling</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="tab-content">
                <!-- Tab 1: All Products (8 Items) -->
                <div id="tab-1" class="tab-pane fade show p-0 active">
                    <div class="row g-4">
                        <c:forEach begin="0" end="7" varStatus="loop">
                            <div class="col-md-6 col-lg-4 col-xl-3">
                                <jsp:include page="/WEB-INF/view/client/component/common/verticalProductCard.jsp"/>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <!-- Tab 2: New Arrivals -->
                <div id="tab-2" class="tab-pane fade show p-0">
                    <div class="row g-4">
                        <c:forEach begin="0" end="2" varStatus="loop">
                            <div class="col-md-6 col-lg-4 col-xl-3">
                                <jsp:include page="/WEB-INF/view/client/component/common/verticalProductCard.jsp"/>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <!-- Tab 3: Featured -->
                <div id="tab-3" class="tab-pane fade show p-0">
                    <div class="row g-4">
                        <c:forEach begin="0" end="4" varStatus="loop">
                            <div class="col-md-6 col-lg-4 col-xl-3">
                                <jsp:include page="/WEB-INF/view/client/component/common/verticalProductCard.jsp"/>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <!-- Tab 4: Top Selling -->
                <div id="tab-4" class="tab-pane fade show p-0">
                    <div class="row g-4">
                        <c:forEach begin="0" end="5" varStatus="loop">
                            <div class="col-md-6 col-lg-4 col-xl-3">
                                <jsp:include page="/WEB-INF/view/client/component/common/verticalProductCard.jsp"/>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
