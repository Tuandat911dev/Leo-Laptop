<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<link href="/css/admin/user/create.css" rel="stylesheet">

<style>
    .product-image-upload {
        position: relative;
        max-width: 300px;
        margin: 0 auto 20px auto;
    }
    .product-image-edit {
        position: absolute;
        right: 10px;
        z-index: 1;
        top: 10px;
    }
    .product-image-edit input {
        display: none;
    }
    .product-image-edit label {
        display: inline-flex;
        width: 34px;
        height: 34px;
        margin-bottom: 0;
        border-radius: 100%;
        background: #FFFFFF;
        border: 1px solid #d2d6de;
        box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.12);
        cursor: pointer;
        font-weight: normal;
        transition: all 0.2s ease-in-out;
        align-items: center;
        justify-content: center;
    }
    .product-image-edit label:hover {
        background: #f1f1f1;
        border-color: #d2d6de;
    }
    .product-image-preview {
        width: 100%;
        height: 300px;
        position: relative;
        border: 2px dashed #d2d6de;
        border-radius: 10px;
        background-image: url('/images/product/default-product.png');
        background-size: contain;
        background-repeat: no-repeat;
        background-position: center;
    }
    .product-image-preview > div {
        width: 100%;
        height: 100%;
        border-radius: 8px;
        background-size: contain;
        background-repeat: no-repeat;
        background-position: center;
    }
</style>

<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Thêm mới sản phẩm</h1>
    <a href="/admin/products" class="btn btn-sm btn-secondary shadow-sm">
        <i class="fas fa-arrow-left fa-sm text-white-50"></i> Quay lại danh sách
    </a>
</div>

<div class="row justify-content-center">
    <div class="col-xl-10 col-lg-11">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Thông tin chi tiết sản phẩm</h6>
            </div>
            <div class="card-body">
                <form:form method="POST" action="/admin/products/update/${currentProduct.id}"
                           modelAttribute="currentProduct"
                           enctype="multipart/form-data" id="formUpdate">

                    <div class="row">
                        <div class="col-md-5 text-center border-right">
                            <div class="product-image-upload">
                                <div class="product-image-edit">
                                    <input type='file' id="imageUpload" name="productFile" accept=".png, .jpg, .jpeg"/>
                                    <label for="imageUpload"><i class="fas fa-camera text-gray-600"></i></label>
                                </div>
                                <div class="product-image-preview">
                                    <img class="product-image-img" src="/images/product/${currentProduct.image}"
                                         alt="" style="display:
                                    none">
                                </div>
                            </div>
                            <h5 class="font-weight-bold mt-2">Hình ảnh sản phẩm</h5>
                            <p class="small text-muted">Kích thước khuyến nghị: 800x800px (Tỷ lệ 1:1)</p>

                            <div class="alert alert-info text-left small mt-4">
                                <i class="fas fa-info-circle"></i> <b>Lưu ý:</b> Hãy chọn hình ảnh rõ ràng, nền trắng để sản phẩm trông chuyên nghiệp hơn trên website.
                            </div>
                        </div>

                        <div class="col-md-7">
                            <div class="row">
                                <div class="col-md-12 mb-3">
                                    <label class="font-weight-bold">Tên sản phẩm</label>
                                    <spring:bind path="name">
                                        <form:input path="name" class="form-control ${status.error ? 'is-invalid' :
                                        ''}"
                                                    placeholder="Ví dụ: iPhone 15 Pro Max"/>
                                        <form:errors path="name" cssClass="invalid-feedback"/>
                                    </spring:bind>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="font-weight-bold">Giá bán (VNĐ)</label>
                                    <spring:bind path="price">
                                        <form:input type="number" path="price" class="form-control ${status.error ? 'is-invalid' :
                                        ''}"
                                                    placeholder="0"/>
                                        <form:errors path="price" cssClass="invalid-feedback"/>
                                    </spring:bind>

                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="font-weight-bold">Số lượng trong kho</label>
                                    <spring:bind path="quantity">
                                        <form:input type="number" path="quantity" class="form-control ${status.error ? 'is-invalid' :
                                        ''}"
                                                    placeholder="0"/>
                                        <form:errors path="quantity" cssClass="invalid-feedback"/>
                                    </spring:bind>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="font-weight-bold">Hãng sản xuất</label>
                                    <form:select path="factory" class="form-control">
                                        <option value="Dell">Dell</option>
                                        <option value="LG">LG</option>
                                        <option value="Asus">Asus</option>
                                        <option value="Acer">Acer</option>
                                    </form:select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="font-weight-bold">Mục đích sử dụng</label>
                                    <form:select path="target" class="form-control">
                                        <option value="Văn phòng">Văn phòng</option>
                                        <option value="Gaming">Gaming</option>
                                        <option value="Đồ hoạ">Đồ hoạ</option>
                                        <option value="Lập trình">Lập trình</option>
                                    </form:select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-3">
                                    <label class="font-weight-bold">Mô tả ngắn</label>
                                    <spring:bind path="shortDesc">
                                        <form:textarea path="shortDesc" class="form-control ${status.error ? 'is-invalid' :
                                        ''}" rows="2"
                                                       placeholder="Tóm tắt đặc điểm nổi bật..."/>
                                        <form:errors path="shortDesc" cssClass="invalid-feedback"/>
                                    </spring:bind>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-3">
                                    <label class="font-weight-bold">Mô tả chi tiết</label>
                                    <spring:bind path="detailDesc">
                                        <form:textarea path="detailDesc" class="form-control ${status.error ? 'is-invalid' :
                                        ''}" rows="5"
                                                       placeholder="Nhập thông số kỹ thuật, bài viết giới thiệu..."/>
                                        <form:errors path="detailDesc" cssClass="invalid-feedback"/>
                                    </spring:bind>
                                </div>
                            </div>

                            <div class="mt-4 text-right">
                                <button type="reset" class="btn btn-light mr-2">Hủy bỏ</button>
                                <button type="submit" class="btn btn-primary px-4">
                                    <i class="fas fa-save mr-1"></i> Lưu sản phẩm
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
        const imagePreview = document.querySelector('.product-image-preview');
        const urlImg = document.querySelector('.product-image-img');
        const imgUrl = urlImg.src;

        imagePreview.style.backgroundImage = "url('" + imgUrl + "')";

        if (uploadInput) {
            uploadInput.addEventListener('change', function (e) {
                const file = e.target.files[0];
                if (file) {
                    imagePreview.style.backgroundImage = "url('" + URL.createObjectURL(file) + "')";
                }
            });
        }
    });
</script>