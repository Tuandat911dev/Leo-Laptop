<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="products-mini-item border">
    <div class="row g-0">
        <div class="col-5">
            <div class="products-mini-img border-end h-100">
                <img src="/images/product/${product.image}" class="img-fluid w-100 h-100" alt="Image">
                <div class="products-mini-icon rounded-circle bg-primary">
                    <a href="/product/${product.id}"><i class="fa fa-eye fa-1x text-white"></i></a>
                </div>
            </div>
        </div>
        <div class="col-7">
            <div class="products-mini-content p-3">
                <a href="/product/${product.id}" class="d-block mb-2">${product.target}</a>
                <a href="/product/${product.id}" class="d-block h4">${product.name}</a>
                <span class="text-primary fs-5">
                    <fmt:formatNumber value="${product.price}" pattern="#,### ₫"/>
                </span>
            </div>
        </div>
    </div>
    <div class="products-mini-add border p-3">
        <form action="/cart" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <input type="number" name="productId" value="${product.id}" hidden>
            <input type="number" name="userId" value="${sessionScope.userId}" hidden>
            <input type="number" name="quantity" value="1" hidden>

            <button type="submit" class="btn btn-primary border-secondary rounded-pill py-2 px-4">
                <i class="fas fa-shopping-cart me-2">Add To Cart</i>
            </button>
        </form>

        <div class="d-flex">
            <a href="#" class="text-primary d-flex align-items-center justify-content-center me-3">
                <span class="rounded-circle btn-sm-square border"><i class="fas fa-random"></i></span>
            </a>
            <a href="#" class="text-primary d-flex align-items-center justify-content-center me-0">
                <span class="rounded-circle btn-sm-square border"><i class="fas fa-heart"></i></span>
            </a>
        </div>
    </div>
</div>
