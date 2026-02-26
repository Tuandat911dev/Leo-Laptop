<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="container py-5">
    <div class="row">
        <div class="col-lg-4">
            <div class="card shadow mb-4">
                <div class="card-body text-center">
                    <img id="avatarPreview"
                    <c:choose>
                    <c:when test='${user.avatar.startsWith("https")}'>
                         src="${user.avatar}"
                    </c:when>
                    <c:otherwise>
                         src="/images/avatar/${user.avatar}"
                    </c:otherwise>
                    </c:choose>
                         alt="avatar"
                         class="rounded-circle img-fluid border p-1"
                         style="width: 150px; height: 150px; object-fit: cover;">
                    <h5 class="my-3 font-weight-bold">${user.fullName}</h5>
                </div>
            </div>
        </div>

        <div class="col-lg-8">
            <div class="card shadow mb-4">
                <div class="card-header p-0 border-bottom-0">
                    <ul class="nav nav-tabs" id="accountTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="info-tab" data-toggle="tab" href="#info" role="tab">
                                <i class="fas fa-user-edit mr-2"></i>Thông tin cá nhân
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="password-tab" data-toggle="tab" href="#password" role="tab">
                                <i class="fas fa-key mr-2"></i>Đổi mật khẩu
                            </a>
                        </li>
                    </ul>
                </div>

                <div class="card-body">
                    <div class="tab-content" id="accountTabContent">
                        <div class="tab-pane fade show active" id="info" role="tabpanel" aria-labelledby="info-tab">
                            <form:form method="POST" action="/account/update-info" modelAttribute="user"
                                       enctype="multipart/form-data">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="hidden" name="id" value="${user.id}"/>
                                <input type="hidden" name="email" value="${user.email}"/>
                                <input type="hidden" name="roleName" value="${user.roleName}"/>
                                <input type="hidden" name="roleId" value="${user.roleId}"/>
                                <input type="hidden" name="avatar" value="${user.avatar}"/>
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="font-weight-bold">Họ và Tên</label>
                                        <form:input path="fullName" class="form-control"
                                                    placeholder="Nhập họ tên đầy đủ"/>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="font-weight-bold">Số điện thoại</label>
                                        <spring:bind path="user.phone">
                                            <form:input path="phone"
                                                        class="form-control ${status.error ? 'is-invalid' : ''}"
                                                        placeholder="090..."/>
                                        </spring:bind>
                                        <form:errors cssClass="invalid-feedback" path="phone"/>

                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label class="font-weight-bold">Địa chỉ</label>
                                    <form:textarea path="address" class="form-control" rows="3"
                                                   placeholder="Địa chỉ nhận hàng"/>
                                </div>
                                <div class="mb-3">
                                    <label class="font-weight-bold d-block">Ảnh đại diện mới</label>
                                    <input type="file" name="avatarFile" id="avatarInput" class="form-control-file"
                                           accept=".png, .jpg, .jpeg">
                                </div>
                                <hr>
                                <button type="submit" class="btn btn-primary px-4"><i class="fas fa-save mr-1"></i> Lưu
                                    thay đổi
                                </button>
                            </form:form>
                        </div>

                        <div class="tab-pane fade" id="password" role="tabpanel" aria-labelledby="password-tab">
                            <form action="/account/change-password" method="POST" id="changePasswordForm">
                                <div class="mb-3">
                                    <label class="font-weight-bold">Mật khẩu hiện tại</label>
                                    <input type="password" name="oldPassword" class="form-control"
                                           placeholder="Xác nhận mật khẩu cũ" required>
                                </div>
                                <div class="mb-3">
                                    <label class="font-weight-bold">Mật khẩu mới</label>
                                    <input type="password" name="newPassword" id="newPassword" class="form-control"
                                           placeholder="Tối thiểu 6 ký tự" required>
                                </div>
                                <div class="mb-3">
                                    <label class="font-weight-bold">Xác nhận mật khẩu mới</label>
                                    <input type="password" name="rePassword" id="rePassword" class="form-control"
                                           placeholder="Nhập lại mật khẩu mới" required>
                                    <div class="invalid-feedback">Mật khẩu xác nhận không trùng khớp!</div>
                                </div>
                                <hr>
                                <button type="submit" class="btn btn-warning px-4 font-weight-bold text-white"><i
                                        class="fas fa-sync-alt mr-1"></i> Cập nhật mật khẩu
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const avatarInput = document.getElementById('avatarInput');
        const avatarPreview = document.getElementById('avatarPreview');

        if (avatarInput && avatarPreview) {
            avatarInput.addEventListener('change', function (e) {
                const file = e.target.files[0];
                if (file) {
                    if (avatarPreview.src.startsWith('blob:')) {
                        URL.revokeObjectURL(avatarPreview.src);
                    }
                    const objectUrl = URL.createObjectURL(file);
                    avatarPreview.src = objectUrl;
                }
            });
        }

        const changePasswordForm = document.getElementById('changePasswordForm');
        if (changePasswordForm) {
            changePasswordForm.addEventListener('submit', function (e) {
                const newPass = document.getElementById('newPassword').value;
                const rePass = document.getElementById('rePassword').value;
                const reInput = document.getElementById('rePassword');

                if (newPass !== rePass) {
                    e.preventDefault();
                    reInput.classList.add('is-invalid');
                } else {
                    reInput.classList.remove('is-invalid');
                }
            });
        }

        var tabLinks = document.querySelectorAll('#accountTab a');
        tabLinks.forEach(function (link) {
            link.addEventListener('click', function (e) {
                e.preventDefault();
                if (window.jQuery && $.fn.tab) {
                    $(this).tab('show');
                } else {
                    tabLinks.forEach(item => item.classList.remove('active'));
                    this.classList.add('active');

                    const targetId = this.getAttribute('href');
                    const contents = document.querySelectorAll('.tab-pane');
                    contents.forEach(content => {
                        content.classList.remove('show', 'active');
                        if ('#' + content.id === targetId) {
                            content.classList.add('show', 'active');
                        }
                    });
                }
            });
        });
    });
</script>