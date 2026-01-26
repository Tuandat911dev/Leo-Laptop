<!DOCTYPE html>
<html lang="vi">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Quản lý User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet">
    <link href="<c:url value="/resources/css/admin/user/table.css" />" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
</head>
<body>

<div class="container admin-container">
    <div class="row table-title align-items-center">
        <div class="col-sm-6">
            <h2 class="m-0">Quản lý <b>Người dùng</b></h2>
        </div>
        <div class="col-sm-6 text-end">
            <a href="/admin/users/create">
                <span class="btn btn-dark">
                    <i class="fa-solid fa-circle-plus"></i> <span>Tạo mới User</span>
                </span>
            </a>

        </div>
    </div>

    <div class="table-responsive">
        <table class="table table-hover table-bordered align-middle">
            <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Họ và Tên</th>
                <th>Email</th>
                <th>Số điện thoại</th>
                <th>Địa chỉ</th>
                <th class="text-center">Thao tác</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="user" items="${userList}">
                <tr>
                    <td>
                        <a href="javascript:void(0);"
                           class="user-id-link"
                           onclick="showUserDetail(${user.id})">
                                ${user.id}
                        </a>
                    </td>

                    <td>${user.fullName}</td>
                    <td>${user.email}</td>
                    <td>${user.phone}</td>
                    <td>${user.address}</td>
                    <td class="text-center">
                        <a href="/admin/users/update/${user.id}" class="btn btn-warning btn-sm btn-action" title="Sửa">
                            <i class="bi bi-pencil-square"></i>
                        </a>
                        <a href="#" class="btn btn-danger btn-sm btn-action" title="Xóa">
                            <i class="bi bi-trash"></i>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<%--User detail--%>
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasUserDetails" aria-labelledby="offcanvasLabel">
    <div class="offcanvas-header bg-dark text-white">
        <h5 class="offcanvas-title" id="offcanvasLabel">Chi tiết người dùng</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        <div id="loadingSpinner" class="text-center d-none">
            <div class="spinner-border text-primary" role="status"></div>
        </div>

        <div id="userDetailContent">
            <div class="user-profile-header">
                <div class="user-avatar-circle">
                    <i class="bi bi-person-fill"></i>
                </div>
                <h4 id="offcanvas-name" class="fw-bold mb-1"></h4>
                <span class="badge rounded-pill text-primary" style="background-color: #e7f1ff;">Customer</span>
            </div>

            <div class="detail-item">
                <span class="detail-label">Email</span>
                <div class="detail-value">
                    <i class="bi bi-envelope-at me-2"></i>
                    <span id="offcanvas-email"></span>
                </div>
            </div>

            <div class="detail-item">
                <span class="detail-label">Số điện thoại</span>
                <div class="detail-value">
                    <i class="bi bi-telephone me-2"></i>
                    <span id="offcanvas-phone"></span>
                </div>
            </div>

            <div class="detail-item">
                <span class="detail-label">Địa chỉ</span>
                <div class="detail-value">
                    <i class="bi bi-geo-alt me-2"></i>
                    <span id="offcanvas-address"></span>
                </div>
            </div>

            <div class="d-grid mt-5">
                <button class="btn btn-outline-primary shadow-sm" type="button">
                    <i class="bi bi-pencil-square me-2"></i>Chỉnh sửa hồ sơ
                </button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
    function showUserDetail(userId) {
        const myOffcanvas = new bootstrap.Offcanvas(document.getElementById('offcanvasUserDetails'));

        document.getElementById('loadingSpinner').classList.remove('d-none');
        document.getElementById('userDetailContent').classList.add('d-none');

        myOffcanvas.show();
        const backendUrl = '/admin/users/' + userId;

        fetch(backendUrl)
            .then(response => {
                if (!response.ok) throw new Error('Không thể lấy dữ liệu');
                return response.json();
            })
            .then(data => {
                document.getElementById('offcanvas-name').innerText = data.fullName;
                document.getElementById('offcanvas-email').innerText = data.email;
                document.getElementById('offcanvas-phone').innerText = data.phone;
                document.getElementById('offcanvas-address').innerText = data.address;

                document.getElementById('loadingSpinner').classList.add('d-none');
                document.getElementById('userDetailContent').classList.remove('d-none');
            })
            .catch(error => {
                console.error('Lỗi:', error);
                alert('Có lỗi xảy ra khi tải dữ liệu!');
            });
    }
</script>
</body>
</html>