<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid px-5 d-none border-bottom d-lg-block">
    <div class="row gx-0 d-flex justify-content-between align-items-center">
        <div class="col-lg-4 text-center text-lg-start mb-lg-0">
            <div class="d-inline-flex align-items-center" style="height: 45px;">
                <a href="#!" class="text-muted me-2 small">Hướng dẫn</a>
                <small class="text-muted">/</small>

                <a href="#!" class="text-muted mx-2 small">Chính sách</a>
                <small class="text-muted">/</small>

                <a href="#!" class="text-muted ms-2 small">Liên hệ</a>
            </div>
        </div>

        <div class="col-lg-4 text-center text-lg-end">
            <div class="d-inline-flex align-items-center" style="height: 45px;">
                <div class="dropdown">
                    <c:if test="${not empty sessionScope.fullName}">
                        <a href="#" class="dropdown-toggle text-muted ms-2 d-flex align-items-center" style="gap:
                         5px" data-bs-toggle="dropdown">
                            <small class="d-flex align-items-center" style="gap: 5px">
                                <img
                                        style="width: 35px; height: 35px; object-fit: cover; border-radius: 50%;"
                                        src="
                                        <c:choose>
                                            <c:when test='${not empty sessionScope.avatar and sessionScope.avatar.startsWith("https")}'>
                                                ${sessionScope.avatar}
                                            </c:when>
                                            <c:otherwise>
                                                /images/avatar/${sessionScope.avatar}
                                            </c:otherwise>
                                        </c:choose>"
                                        alt="avatar"
                                />
                                <c:out value="${sessionScope.fullName}"/>
                            </small>
                        </a>

                        <div class="dropdown-menu rounded">
                            <a href="#" class="dropdown-item">Quản lý tài khoản</a>
                            <a href="/cart" class="dropdown-item">Giỏ hàng</a>
                            <a href="/history" class="dropdown-item">Lịch sử mua hàng</a>
                            <form action="/logout" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <button type="submit" class="dropdown-item">Đăng xuất</button>
                            </form>

                            <c:if test="${sessionScope.roleName == 'ADMIN'}">
                                <a href="/admin/dashboard" class="dropdown-item">Trang quản trị</a>
                            </c:if>
                        </div>
                    </c:if>

                    <c:if test="${empty sessionScope.fullName}">
                        <a href="/login" class="dropdown-toggle text-muted ms-2" data-bs-toggle="dropdown">
                            <small>
                                <i class="fas fa-user" style="margin-right: 10px"></i>
                                Đăng nhập
                            </small>
                        </a>

                        <div class="dropdown-menu rounded">
                            <a href="/login" class="dropdown-item">Đăng nhập</a>
                            <a href="/register" class="dropdown-item">Đăng ký tài khoản</a>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid px-5 py-4 d-none d-lg-block">
    <div class="row gx-0 d-flex justify-content-between align-items-center text-center">
        <div class="col-md-4 col-lg-3 text-center text-lg-start">
            <div class="d-inline-flex align-items-center">
                <a href="/" class="navbar-brand p-0">
                    <h1 class="display-5 text-primary m-0"><i class="fas fa-laptop" style="color: #f92400;"></i>Leolaptop
                    </h1>
                </a>
            </div>
        </div>

        <c:if test="${not empty sessionScope.fullName}">
            <div class="col-md-4 col-lg-3 text-center text-lg-end">
                <div class="d-inline-flex align-items-center">
                    <a href="/cart" class="text-muted d-flex align-items-center justify-content-center">
                        <span class="rounded-circle btn-md-square border">
                            <i class="fas fa-shopping-cart"></i>
                        </span>
                    </a>
                </div>
            </div>
        </c:if>
    </div>
</div>