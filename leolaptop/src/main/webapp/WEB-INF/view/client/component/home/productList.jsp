<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid products productList overflow-hidden">
    <div class="container products-mini py-5">
        <div class="mx-auto text-center mb-5" style="max-width: 900px;">
            <h4 class="text-primary border-bottom border-primary border-2 d-inline-block p-2 title-border-radius wow fadeInUp"
                data-wow-delay="0.1s">Danh mục sản phẩm</h4>
            <h1 class="mb-3 display-4 wow fadeInUp" data-wow-delay="0.3s">Hệ Sinh Thái Laptop & Phụ Kiện</h1>
            <p class="mb-0 wow fadeInUp" data-wow-delay="0.5s">
                Tổng hợp những dòng máy mới nhất, từ laptop văn phòng mỏng nhẹ đến những "quái thú" gaming mạnh mẽ.
                LeoLaptop cam kết mang đến chất lượng và chế độ bảo hành hàng đầu tại Hà Nội.
            </p>
        </div>
        <div class="productList-carousel owl-carousel pt-4 wow fadeInUp" data-wow-delay="0.3s">
            <c:forEach items="${productList}" var="item">
                <c:set var="product" value="${item}" scope="request"/>
                <jsp:include page="/WEB-INF/view/client/component/common/horizontalProductCard.jsp"/>
            </c:forEach>
        </div>
    </div>
</div>