<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="/css/admin/user/table.css" rel="stylesheet">
<style>
    .product-img-table {
        width: 60px;
        height: 60px;
        object-fit: cover;
        border-radius: 5px;
        border: 1px solid #e3e6f0;
    }

    .product-img-detail {
        width: 100%;
        max-height: 250px;
        object-fit: contain;
        background: #f8f9fc;
        border-radius: 8px;
        margin-bottom: 15px;
    }

    .description-box {
        background: #f8f9fc;
        padding: 10px;
        border-radius: 5px;
        font-size: 0.9rem;
        max-height: 150px;
        overflow-y: auto;
    }
</style>

<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Quản lý sản phẩm</h1>
    <a href="/admin/products/create" class="btn btn-sm btn-primary shadow-sm">
        <i class="fas fa-plus fa-sm text-white-50"></i> Thêm sản phẩm mới
    </a>
</div>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Danh sách sản phẩm</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                <thead class="thead-light">
                <tr>
                    <th>ID</th>
                    <th>Hình ảnh</th>
                    <th>Tên sản phẩm</th>
                    <th>Giá bán</th>
                    <th>Kho</th>
                    <th>Đã bán</th>
                    <th class="text-center">Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="product" items="${productList}">
                    <tr>
                        <td>
                            <button type="button" class="btn btn-link p-0 font-weight-bold"
                                    onclick="showProductDetail(${product.id})">
                                #${product.id}
                            </button>
                        </td>
                        <td class="text-center">
                            <img src="/images/product/${product.image}" class="product-img-table" alt="product">
                        </td>
                        <td>${product.name}</td>
                        <td class="text-danger font-weight-bold">
                            <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="đ"/>
                        </td>
                        <td>${product.quantity}</td>
                        <td>${product.sold}</td>
                        <td class="text-center">
                            <a href="/admin/products/update/${product.id}" class="btn btn-warning btn-circle-sm mr-1">
                                <i class="fas fa-pencil-alt"></i>
                            </a>
                            <button onclick="handleDeleteProduct(${product.id})" class="btn btn-danger btn-circle-sm">
                                <i class="fas fa-trash"></i>
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <nav aria-label="Page navigation example mt-3">
                <ul class="pagination justify-content-end">
                    <li class="page-item ${page == 1 ? 'disabled' : ''}">
                        <a class="page-link" href="/admin/products?page=${page - 1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <li class="page-item ${page == i ? 'active' : ''}">
                            <a class="page-link" href="/admin/products?page=${i}">${i}</a>
                        </li>
                    </c:forEach>
                    <li class="page-item ${page == totalPages ? 'disabled' : ''}">
                        <a class="page-link" href="/admin/products?page=${page + 1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>

<!-- Drawer / Offcanvas -->
<div id="offcanvasOverlay" onclick="closeOffcanvas()"></div>

<div id="offcanvasUserDetails" style="width: 450px;">
    <div class="off-header">
        <h5 class="m-0 font-weight-bold">Chi tiết sản phẩm</h5>
        <button class="close-btn" onclick="closeOffcanvas()">&times;</button>
    </div>

    <div class="off-body">
        <div id="loadingSpinner" class="text-center d-none my-5">
            <div class="spinner-border text-primary" role="status"></div>
        </div>

        <div id="userDetailContent">
            <div class="text-center">
                <img id="off-image" class="product-img-detail" src="" alt="product">
                <h4 id="off-name" class="font-weight-bold text-gray-900 mb-1"></h4>
                <p class="text-muted">Mã sản phẩm: <span id="off-id" class="font-weight-bold"></span></p>
            </div>

            <div class="row mb-3">
                <div class="col-6 border-right">
                    <label class="small text-uppercase mb-0">Giá bán</label>
                    <div class="text-danger font-weight-bold" id="off-price"></div>
                </div>
                <div class="col-6 pl-3">
                    <label class="small text-uppercase mb-0">Hãng SX</label>
                    <div id="off-factory" class="font-weight-bold"></div>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-6 border-right">
                    <label class="small text-uppercase mb-0">Kho hàng</label>
                    <div id="off-quantity"></div>
                </div>
                <div class="col-6 pl-3">
                    <label class="small text-uppercase mb-0">Đã bán</label>
                    <div id="off-sold"></div>
                </div>
            </div>

            <div class="detail-item">
                <label>Đối tượng hướng đến</label>
                <div class="value"><i class="fas fa-bullseye"></i> <span id="off-target"></span></div>
            </div>

            <div class="detail-item">
                <label>Mô tả ngắn</label>
                <div id="off-shortDesc" class="font-italic text-muted small"></div>
            </div>

            <div class="detail-item">
                <label>Mô tả chi tiết</label>
                <div id="off-detailDesc" class="description-box"></div>
            </div>

            <a href="#" id="off-edit-link" class="btn btn-primary btn-block mt-4 shadow-sm">
                <i class="fas fa-edit mr-2"></i>Chỉnh sửa sản phẩm
            </a>
        </div>
    </div>
</div>

<script>
    function showProductDetail(productId) {
        $('#offcanvasOverlay').fadeIn(200);
        $('#offcanvasUserDetails').addClass('active');

        $('#loadingSpinner').removeClass('d-none');
        $('#userDetailContent').addClass('d-none');

        fetch('/admin/products/' + productId)
            .then(res => {
                if (!res.ok) throw new Error("Lỗi mạng");
                return res.json();
            })
            .then(data => {
                $('#off-image').attr('src', '/images/product/' + data.image);
                $('#off-id').text(data.id);
                $('#off-name').text(data.name);
                $('#off-price').text(new Intl.NumberFormat('vi-VN', {
                    style: 'currency',
                    currency: 'VND'
                }).format(data.price));
                $('#off-quantity').text(data.quantity + ' sản phẩm');
                $('#off-sold').text(data.sold + ' đã bán');
                $('#off-factory').text(data.factory);
                $('#off-target').text(data.target);
                $('#off-shortDesc').text(data.shortDesc);
                $('#off-detailDesc').text(data.detailDesc);

                $('#off-edit-link').attr('href', '/admin/products/update/' + data.id);

                $('#loadingSpinner').addClass('d-none');
                $('#userDetailContent').removeClass('d-none');
            })
            .catch(err => {
                console.error(err);
                alert("Không thể tải thông tin sản phẩm!");
                closeOffcanvas();
            });
    }

    function closeOffcanvas() {
        $('#offcanvasOverlay').fadeOut(200);
        $('#offcanvasUserDetails').removeClass('active');
    }

    function handleDeleteProduct(id) {
        if (confirm('Bạn có chắc chắn muốn xóa sản phẩm này?')) {
            fetch('/admin/products/delete/' + id, {method: 'DELETE'})
                .then(res => {
                    if (res.ok) window.location.reload();
                    else alert("Xóa thất bại!");
                });
        }
    }
</script>
