<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="/css/admin/user/table.css" rel="stylesheet">

<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Quản lý người dùng</h1>
    <a href="/admin/users/create" class="btn btn-sm btn-primary shadow-sm">
        <i class="fas fa-plus fa-sm text-white-50"></i> Tạo mới User
    </a>
</div>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Danh sách người dùng</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                <thead class="thead-light">
                <tr>
                    <th>ID</th>
                    <th>Họ và Tên</th>
                    <th>Email</th>
                    <th>Số điện thoại</th>
                    <th>Địa chỉ</th>
                    <th>Vai trò</th>
                    <th class="text-center">Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${userList}">
                    <tr>
                        <td>
                            <button type="button" class="btn btn-link p-0 font-weight-bold"
                                    onclick="showUserDetail(${user.id})">
                                #${user.id}
                            </button>
                        </td>
                        <td>${user.fullName}</td>
                        <td>${user.email}</td>
                        <td>${user.phone}</td>
                        <td>${user.address}</td>
                        <td>
                            <c:choose>
                                <c:when test="${user.roleName == 'ADMIN'}">
                                    <span class="badge badge-warning">${user.roleName}</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge badge-info">${user.roleName}</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="text-center">
                            <a href="/admin/users/update/${user.id}" class="btn btn-warning btn-circle-sm mr-1">
                                <i class="fas fa-pencil-alt"></i>
                            </a>
                            <button onclick="handleDeleteUser(${user.id})" class="btn btn-danger btn-circle-sm">
                                <i class="fas fa-trash"></i>
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div id="offcanvasOverlay" onclick="closeOffcanvas()"></div>

<div id="offcanvasUserDetails">
    <div class="off-header">
        <h5 class="m-0 font-weight-bold">Thông tin người dùng</h5>
        <button class="close-btn" onclick="closeOffcanvas()">&times;</button>
    </div>

    <div class="off-body">
        <div id="loadingSpinner" class="text-center d-none my-5">
            <div class="spinner-border text-primary" role="status"></div>
        </div>

        <div id="userDetailContent">
            <div class="user-info-card">
                <div class="avatar-main">
                    <img class="avatar-img" src="/images/avatar/avatar-default.png" alt="">
                </div>
                <h4 id="off-name" class="font-weight-bold text-gray-900 mb-0"></h4>
                <p class="text-muted">ID: <span id="off-id"></span></p>
            </div>

            <div class="detail-item">
                <label>Vai trò</label>
                <div class="value"><i class="fas fa-user-tag"></i> <span id="off-role"></span></div>
            </div>

            <div class="detail-item">
                <label>Email</label>
                <div class="value"><i class="fas fa-envelope"></i> <span id="off-email"></span></div>
            </div>

            <div class="detail-item">
                <label>Số điện thoại</label>
                <div class="value"><i class="fas fa-phone"></i> <span id="off-phone"></span></div>
            </div>

            <div class="detail-item">
                <label>Địa chỉ</label>
                <div class="value"><i class="fas fa-map-marker-alt"></i> <span id="off-address"></span></div>
            </div>

            <a href="#" id="off-edit-link" class="btn btn-primary btn-block mt-4 shadow-sm">
                <i class="fas fa-edit mr-2"></i>Chỉnh sửa thông tin
            </a>
        </div>
    </div>
</div>

<script>
    function showUserDetail(userId) {
        $('#offcanvasOverlay').fadeIn(200);
        $('#offcanvasUserDetails').addClass('active');

        $('#loadingSpinner').removeClass('d-none');
        $('#userDetailContent').addClass('d-none');

        fetch('/admin/users/' + userId)
            .then(res => {
                if (!res.ok) throw new Error("Lỗi mạng");
                return res.json();
            })
            .then(data => {
                document.querySelector(".avatar-img").src = "/images/avatar/" + data.avatar;
                $('#off-role').text(data.roleName);
                $('#off-name').text(data.fullName);
                $('#off-id').text(data.id);
                $('#off-email').text(data.email);
                $('#off-phone').text(data.phone);
                $('#off-address').text(data.address);
                $('#off-edit-link').attr('href', '/admin/users/update/' + data.id);

                $('#loadingSpinner').addClass('d-none');
                $('#userDetailContent').removeClass('d-none');
            })
            .catch(err => {
                console.error(err);
                alert("Không thể tải thông tin chi tiết!");
                closeOffcanvas();
            });
    }

    function closeOffcanvas() {
        $('#offcanvasOverlay').fadeOut(200);
        $('#offcanvasUserDetails').removeClass('active');
    }

    function handleDeleteUser(id) {
        if (confirm('Bạn có chắc chắn muốn xóa người dùng này?')) {
            fetch('/admin/users/delete/' + id, {method: 'DELETE'})
                .then(() => {
                    window.location.reload();
                });
        }
    }
</script>