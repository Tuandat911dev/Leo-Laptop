<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid product py-5">
    <div class="container py-5">
        <div class="tab-class">
            <div class="row g-4">
                <div class="col-lg-6 text-start wow fadeInLeft" data-wow-delay="0.1s">
                    <h1>Sản Phẩm Của Chúng Tôi</h1>
                </div>
            </div>
            <div class="tab-content">
                <div class="tab-pane fade show p-0 active">
                    <div class="row g-4">
                        <c:forEach items="${productList}" var="item">
                            <div class="col-md-6 col-lg-4 col-xl-3">
                                <c:set var="product" value="${item}" scope="request"/>
                                <jsp:include page="/WEB-INF/view/client/component/common/verticalProductCard.jsp"/>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
