<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div class="product-item rounded wow fadeInUp" data-wow-delay="0.1s">
    <div class="product-item-inner border rounded">
        <div class="product-item-inner-item">
            <img src="/images/product/${product.image}" class="img-fluid w-100 rounded-top" alt="">
            <div class="product-new">New</div>
            <div class="product-details"><a href="/product/${product.id}"><i class="fa fa-eye fa-1x"></i></a>
            </div>
        </div>
        <div class="text-center rounded-bottom p-4">
            <a href="/product/${product.id}" class="d-block mb-2">${product.target}</a>
            <a href="/product/${product.id}" class="d-block h4">${product.name}</a>
            <del class="me-2 fs-5" class>
                <fmt:formatNumber value="${product.price + 99999}" pattern="#,### ₫"/>
            </del>
            <span class="text-primary fs-5">
                <fmt:formatNumber value="${product.price}" pattern="#,### ₫"/>
            </span>
        </div>
    </div>
    <div class="product-item-add border border-top-0 rounded-bottom text-center p-4 pt-0">
        <form action="/cart" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="number" name="productId" value="${product.id}" hidden>
            <input type="number" name="userId" value="${sessionScope.userId}" hidden>
            <input type="number" name="quantity" value="1" hidden>

            <c:choose>
                <c:when test="${not empty sessionScope.fullName}">
                    <button type="submit" class="btn btn-primary border-secondary rounded-pill py-2 px-4 mb-4">
                        <i class="fas fa-shopping-cart me-2">Add To Cart</i>
                    </button>
                </c:when>
                <c:otherwise>
                    <a href="/login"
                       class="btn btn-outline-primary border border-primary rounded-pill px-4 py-2 mb-4">
                        <i class="fa fa-user me-2"></i>
                        Đăng nhập để mua hàng
                    </a>
                </c:otherwise>
            </c:choose>

        </form>
        <div class="d-flex justify-content-between align-items-center">
            <div class="d-flex"><i class="fas fa-star text-primary"></i><i
                    class="fas fa-star text-primary"></i><i
                    class="fas fa-star text-primary"></i><i
                    class="fas fa-star text-primary"></i><i class="fas fa-star"></i></div>
            <div class="d-flex">
                <a href="#"
                   class="text-primary d-flex align-items-center justify-content-center me-3"><span
                        class="rounded-circle btn-sm-square border"><i
                        class="fas fa-random"></i></span></a>
                <a href="#"
                   class="text-primary d-flex align-items-center justify-content-center me-0"><span
                        class="rounded-circle btn-sm-square border"><i
                        class="fas fa-heart"></i></span></a>
            </div>
        </div>
    </div>
</div>