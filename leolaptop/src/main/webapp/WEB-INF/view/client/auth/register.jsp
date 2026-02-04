<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm Người Dùng Mới - LeoLaptop</title>
    <link href="<c:url value="/resources/css/reset.css" />" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet">
    <link href="<c:url value="/resources/css/client/auth/register.css" />" rel="stylesheet">
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
                        <p class="lead opacity-75">Trải nghiệm công nghệ đỉnh cao. Gia nhập cộng đồng của chúng tôi ngay
                            hôm nay.</p>
                        <div class="mt-auto">
                            <small class="opacity-50">Chất lượng - Uy tín - Tận tâm</small>
                        </div>
                    </div>

                    <div class="col-lg-7 form-section">
                        <div class="mb-4">
                            <h2 class="fw-bold mb-1">Tạo tài khoản</h2>
                            <p class="text-secondary">Khám phá thế giới laptop cấu hình khủng</p>
                        </div>

                        <form:form action="/register" method="POST" modelAttribute="newUser">
                            <div class="floating-label-group">
                                <form:label class="form-label small fw-semibold" path="fullName">HỌ VÀ
                                    TÊN</form:label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-person"></i></span>
                                    <spring:bind path="fullName">
                                        <form:input path="fullName" class="form-control ${status.error ? 'is-invalid' :
                                        ''}"
                                                    placeholder="VD: Lionel Messi"/>
                                        <form:errors path="fullName" cssClass="invalid-feedback"/>
                                    </spring:bind>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 floating-label-group">
                                    <form:label class="form-label small fw-semibold" path="email">EMAIL</form:label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                                        <spring:bind path="email">
                                            <form:input path="email" class="form-control ${status.error ? 'is-invalid' :
                                        ''}"
                                                        placeholder="VD: goatsi@gmail.com"/>
                                            <form:errors path="email" cssClass="invalid-feedback"/>
                                        </spring:bind>
                                    </div>
                                </div>
                                <div class="col-md-6 floating-label-group">
                                    <form:label class="form-label small fw-semibold"
                                                path="phone">SỐ ĐIỆN THOẠI</form:label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="bi bi-phone"></i></span>
                                        <spring:bind path="phone">
                                            <form:input type="tel" path="phone" class="form-control ${status.error ?
                                            'is-invalid' :
                                        ''}"
                                                        placeholder="VD: 0901234xxx"/>
                                            <form:errors path="phone" cssClass="invalid-feedback"/>
                                        </spring:bind>
                                    </div>
                                </div>
                            </div>

                            <div class="floating-label-group">
                                <form:label class="form-label small fw-semibold" path="password">MẬT KHẨU</form:label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-shield-lock"></i></span>
                                    <spring:bind path="password">
                                        <form:input path="password" class="form-control ${status.error ?
                                            'is-invalid' :
                                        ''}"
                                                    placeholder="Nhập ít nhất 8 ký tự"/>
                                        <form:errors path="password" cssClass="invalid-feedback"/>
                                    </spring:bind>
                                </div>
                            </div>

                            <div class="floating-label-group">
                                <form:label class="form-label small fw-semibold" path="password">NHẬP LẠI MẬT
                                    KHẨU</form:label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-shield-lock"></i></span>
                                    <spring:bind path="rePassword">
                                        <form:input path="rePassword" class="form-control ${status.error ?
                                            'is-invalid' :
                                        ''}"
                                                    placeholder="Nhập lại mật khẩu"/>
                                        <form:errors path="rePassword" cssClass="invalid-feedback"/>
                                    </spring:bind>
                                </div>
                            </div>

                            <div class="floating-label-group">
                                <form:label class="form-label small fw-semibold"
                                            path="address">ĐỊA CHỈ GIAO HÀNG</form:label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-geo-alt"></i></span>
                                    <spring:bind path="address">
                                        <form:input path="address" class="form-control ${status.error ?
                                            'is-invalid' :
                                        ''}"
                                                    placeholder="Địa chỉ nhận hàng"/>
                                        <form:errors path="address" cssClass="invalid-feedback"/>
                                    </spring:bind>
                                </div>
                            </div>

                            <div class="form-check mb-4">
                                <input class="form-check-input" type="checkbox"/>
                                <label class="form-check-label small text-secondary">
                                    Tôi đồng ý với các
                                    <a href="#" class="text-decoration-none">Điều khoản & Chính sách</a> của LeoLaptop.
                                </label>
                            </div>

                            <button type="submit" class="btn btn-primary btn-submit w-100 mb-3">
                                ĐĂNG KÝ NGAY
                            </button>

                            <div class="text-center">
                                <span class="small text-secondary">Đã có tài khoản?
                                    <a href="/login" class="fw-bold text-decoration-none text-primary">Đăng nhập</a>
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
