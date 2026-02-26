<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid products pb-5">
    <div class="container products-mini py-5">
        <div class="mx-auto text-center mb-5" style="max-width: 700px;">
            <h4 class="text-primary mb-3 border-bottom border-primary border-2 d-inline-block p-2 title-border-radius wow fadeInUp"
                data-wow-delay="0.1s">Sản phẩm bán chạy</h4>
            <p class="mb-0 wow fadeInUp" data-wow-delay="0.2s">
                Khám phá những dòng Laptop dẫn đầu xu hướng với hiệu năng mạnh mẽ và giá thành hợp lý.
                Đây là các mẫu máy được cộng đồng yêu công nghệ tin dùng và đánh giá cao nhất tại LeoLaptop.
            </p>
        </div>
        <div class="row g-4">
            <c:forEach items="${productList}" var="item">
                <div class="col-md-6 col-lg-6 col-xl-4 wow fadeInUp" data-wow-delay="0.3s">
                    <c:set var="product" value="${item}" scope="request"/>
                    <jsp:include page="/WEB-INF/view/client/component/common/horizontalProductCard.jsp"/>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
