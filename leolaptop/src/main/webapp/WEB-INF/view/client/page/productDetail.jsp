<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!-- Banner start -->
<c:set var="breadcrumb" value="${{'lev1t':'Trang chủ','lev1l':'/', 'lev2t': 'Chi tiết sản phẩm'}}"
       scope="request"/>
<c:set var="bannerTitle" value="${'Chi tiết sản phẩm'}"
       scope="request"/>
<jsp:include page="/WEB-INF/view/client/component/common/banner.jsp"/>
<!-- Banner end -->

<!-- Single Products Start -->
<div class="container-fluid shop py-5">
    <div class="container py-5">
        <div class="row g-4">
            <div class="col-lg-5 col-xl-3 wow fadeInUp" data-wow-delay="0.1s">
                <!-- Filter Start -->
                <jsp:include page="/WEB-INF/view/client/component/common/searchBar.jsp"/>
                <jsp:include page="/WEB-INF/view/client/component/common/filter.jsp"/>
                <!-- Filter End -->
            </div>
            <div class="col-lg-7 col-xl-9 wow fadeInUp" data-wow-delay="0.1s">
                <div class="row g-4 single-product">
                    <!-- Single Product Start -->
                    <jsp:include page="/WEB-INF/view/client/component/productDetail/singleProduct.jsp"/>
                    <!-- Single Product End -->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Single Products End -->

<!-- Related Product Start -->
<jsp:include page="/WEB-INF/view/client/component/productDetail/relatedProduct.jsp"/>
<!-- Related Product End -->
