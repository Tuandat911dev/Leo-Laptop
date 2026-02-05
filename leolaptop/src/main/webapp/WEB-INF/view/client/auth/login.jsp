<!DOCTYPE html>
<html lang="vi">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm Người Dùng Mới - LeoLaptop</title>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <link href="/css/reset.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet">
    <link href="/css/client/auth/register.css" rel="stylesheet">
    <link href="/css/client/auth/login.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-12 col-xl-10">
            <div class="signup-container shadow-lg">
                <div class="row g-0">
                    <div class="col-lg-5 brand-section d-none d-lg-flex">
                        <div class="mb-4">
                            <i class="bi bi-laptop" style="font-size: 4rem;"></i>
                        </div>
                        <h1 class="display-6 fw-bold">LeoLaptop</h1>
                        <p class="lead opacity-75">Mừng bạn quay trở lại. Tiếp tục hành trình công nghệ cùng chúng
                            tôi.</p>
                        <div class="mt-auto">
                            <small class="opacity-50">Chất lượng - Uy tín - Tận tâm</small>
                        </div>
                    </div>

                    <div class="col-lg-7 form-section">
                        <div class="mb-5">
                            <h2 class="fw-bold mb-1">Đăng nhập</h2>
                            <p class="text-secondary">Vui lòng nhập thông tin tài khoản của bạn</p>
                        </div>

                        <form:form action="/login" method="POST" modelAttribute="loginUser">
                            <div class="floating-label-group">
                                <c:if test="${param.error != null}">
                                    <div class="my-2" style="color: red;">Email hoặc mật khẩu không đúng</div>
                                </c:if>
                            </div>

                            <div class="floating-label-group">
                                <label class="form-label small fw-semibold" for="email">EMAIL
                                </label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                                    <input type="email" id="email" class="form-control"
                                                placeholder="example@gmail.com" name="username"/>
                                </div>
                            </div>

                            <div class="floating-label-group">
                                <div class="d-flex justify-content-between">
                                    <label class="form-label small fw-semibold"
                                                for="password">MẬT KHẨU</label>
                                    <a href="#!" class="small text-decoration-none">Quên mật khẩu?</a>
                                </div>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-shield-lock"></i></span>
                                    <input type="password" class="form-control" id="password"
                                                   placeholder="Nhập mật khẩu của bạn" name="password"/>
                                </div>
                            </div>

                            <div class="form-check mb-4">
                                <input class="form-check-input" type="checkbox" id="rememberMe"/>
                                <label class="form-check-label small text-secondary" for="rememberMe">
                                    Ghi nhớ đăng nhập
                                </label>
                            </div>

                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                            <button type="submit" class="btn btn-primary btn-submit w-100 mb-4">
                                ĐĂNG NHẬP
                            </button>

                            <div class="d-flex justify-content-between">
                                <span class="small text-secondary">
                                    <a href="/"
                                       class="fw-bold text-decoration-none text-primary d-flex align-items-center"
                                       style="gap: 5px">
                                        <i class="bi bi-house-door-fill"></i>
                                        Trang chủ
                                    </a>
                                </span>
                                <span class="small text-secondary">Chưa có tài khoản?
                                    <a href="/register"
                                       class="fw-bold text-decoration-none text-primary">Đăng ký ngay</a>
                                </span>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</body>
</html>
