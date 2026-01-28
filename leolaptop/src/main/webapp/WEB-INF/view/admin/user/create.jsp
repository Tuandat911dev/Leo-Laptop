<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link href="/css/admin/user/create.css" rel="stylesheet">

<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Tạo người dùng mới</h1>
    <a href="/admin/users" class="btn btn-sm btn-secondary shadow-sm">
        <i class="fas fa-arrow-left fa-sm text-white-50"></i> Quay lại danh sách
    </a>
</div>

<div class="row justify-content-center">
    <div class="col-xl-9 col-lg-10">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Thông tin cá nhân</h6>
            </div>
            <div class="card-body">
                <form:form action="/admin/users/create" method="POST" modelAttribute="newUser"
                           enctype="multipart/form-data">

                    <div class="row">
                        <div class="col-md-4 text-center border-right">
                            <div class="avatar-upload">
                                <div class="avatar-edit">
                                    <input type='file' id="imageUpload" name="avatarFile" accept=".png, .jpg, .jpeg"/>
                                    <label for="imageUpload"><i class="fas fa-pencil-alt text-gray-600"></i></label>
                                </div>
                                <div class="avatar-preview">
                                    <div id="imagePreview"></div>
                                </div>
                            </div>
                            <h5 class="font-weight-bold mt-2">Ảnh đại diện</h5>
                            <p class="small text-muted">Hỗ trợ định dạng JPG, PNG</p>
                        </div>

                        <div class="col-md-8">
                            <div class="row">
                                <div class="col-md-12 mb-3">
                                    <label class="font-weight-bold">Họ và Tên</label>
                                    <form:input path="fullName" class="form-control" placeholder="Nhập đầy đủ họ tên"/>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="font-weight-bold">Email</label>
                                    <form:input type="email" path="email" class="form-control"
                                                placeholder="example@gmail.com"/>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="font-weight-bold">Số điện thoại</label>
                                    <form:input path="phone" class="form-control" placeholder="090..."/>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-3">
                                    <label class="font-weight-bold">Mật khẩu</label>
                                    <form:password path="password" class="form-control"
                                                   placeholder="Nhập mật khẩu an toàn"/>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-3">
                                    <label class="font-weight-bold">Địa chỉ</label>
                                    <form:textarea path="address" class="form-control" rows="2"
                                                   placeholder="Địa chỉ thường trú"/>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="font-weight-bold">Vai trò hệ thống</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fas fa-user-tag"></i></span>
                                        </div>
                                        <form:select path="role.name" class="form-control">
                                            <form:option value="USER">Khách hàng (USER)</form:option>
                                            <form:option value="ADMIN">Quản trị viên (ADMIN)</form:option>
                                        </form:select>
                                    </div>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label class="font-weight-bold">Trạng thái</label>
                                    <select class="form-control" name="status">
                                        <option value="ACTIVE">Đang hoạt động</option>
                                        <option value="LOCKED">Bị khóa</option>
                                    </select>
                                </div>
                            </div>

                            <div class="mt-4 text-right">
                                <button type="reset" class="btn btn-light mr-2">Hủy bỏ</button>
                                <button type="submit" class="btn btn-primary px-4">
                                    <i class="fas fa-save mr-1"></i> Lưu người dùng
                                </button>
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const uploadInput = document.getElementById('imageUpload');
        const imagePreview = document.getElementById('imagePreview');

        if (uploadInput) {
            uploadInput.addEventListener('change', function (e) {
                const file = e.target.files[0];
                if (file) {
                    imagePreview.style.backgroundImage = "url('" + URL.createObjectURL(file) + "')";
                    imagePreview.style.display = 'none';
                    imagePreview.style.display = 'block';
                }
            });
        }
    });
</script>