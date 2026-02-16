<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    body {
        background-color: #fff5f5;
    }

    .payment-card {
        max-width: 500px;
        margin: 80px auto;
        border: none;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(220, 53, 69, 0.1);
    }

    .fail-icon {
        font-size: 80px;
        color: #dc3545;
        margin-bottom: 20px;
    }

    .btn-retry {
        background-color: #dc3545;
        border: none;
        border-radius: 25px;
        padding: 10px 30px;
        color: white;
    }

    .btn-retry:hover {
        background-color: #c82333;
        color: white;
    }
</style>


<div class="container">
    <div class="card payment-card text-center p-5">
        <div class="card-body">
            <i class="fas fa-times-circle fail-icon"></i>
            <h2 class="font-weight-bold mb-3">Thanh Toán Thất Bại</h2>
            <p class="text-muted">Rất tiếc, đã có lỗi xảy ra trong quá trình xử lý giao dịch. Vui lòng kiểm tra lại số
                dư hoặc thông tin thẻ.</p>
            <div class="alert alert-light border text-left mt-4">
                <small class="text-danger font-weight-bold">Lưu ý:</small>
                <p class="mb-0 small">Đơn hàng đã được tự động chuyển sang phương thức thanh toán COD.</p>
            </div>
            <div class="mt-4">
                <a href="/" class="btn btn-retry btn-lg btn-block mb-2">Quay lại trang chủ</a>
            </div>
        </div>
    </div>
</div>
