<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid related-product product">
    <div class="container">
        <div class="mx-auto text-center pb-5">
            <h4 class="text-primary mb-4 border-bottom border-primary border-2 d-inline-block p-2 title-border-radius wow fadeInUp"
                data-wow-delay="0.1s">Sản Phẩm Liên Quan</h4>
        </div>
        <div class="related-carousel owl-carousel pt-4 mb-5">
            <c:forEach items="${productList}" var="item">
                <c:set var="product" value="${item}" scope="request"/>
                <jsp:include page="/WEB-INF/view/client/component/common/verticalProductCard.jsp"/>
            </c:forEach>
        </div>
    </div>
</div>
