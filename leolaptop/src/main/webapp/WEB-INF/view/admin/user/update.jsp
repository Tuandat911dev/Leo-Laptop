<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Cập nhật người dùng - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <link href="<c:url value="/resources/css/admin/user/update.css" />" rel="stylesheet">
</head>
<body>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="card card-form">
                <div class="card-header bg-primary text-white p-3">
                    <h5 class="mb-0"><i class="bi bi-person-gear me-2"></i>Cập nhật thông tin User</h5>
                </div>
                <div class="card-body p-4">

                    <form:form action="/admin/users/update/${id}" method="POST" modelAttribute="currentUser">
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <form:input path="email" class="form-control" type="email"
                                        placeholder="example@gmail.com" disabled="true"/>
                            <form:errors path="email" cssClass="error-message"/>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Họ và Tên</label>
                            <form:input path="fullName" class="form-control" placeholder="Nhập họ tên..."/>
                            <form:errors path="fullName" cssClass="error-message"/>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Số điện thoại</label>
                                <form:input path="phone" class="form-control" placeholder="09xxx..."/>
                                <form:errors path="phone" cssClass="error-message"/>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Địa chỉ</label>
                                <form:input path="address" class="form-control"/>
                                <form:errors path="address" cssClass="error-message"/>
                            </div>
                        </div>

                        <hr class="my-4">

                        <div class="d-flex justify-content-between">
                            <a href="/admin/users" class="btn btn-light border">
                                <i class="bi bi-arrow-left me-1"></i> Quay lại
                            </a>
                            <button type="submit" class="btn btn-primary px-4">
                                <i class="bi bi-save me-1"></i> Lưu thay đổi
                            </button>
                        </div>

                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>