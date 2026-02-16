<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    body {
        background-color: #f8f9fa;
    }

    .payment-card {
        max-width: 500px;
        margin: 80px auto;
        border: none;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }

    .success-icon {
        font-size: 80px;
        color: #28a745;
        margin-bottom: 20px;
    }

    .btn-success-custom {
        background-color: #28a745;
        border: none;
        border-radius: 25px;
        padding: 10px 30px;
        color: #fff;
    }
</style>

<div class="container">
    <div class="card payment-card text-center p-5">
        <div class="card-body">
            <i class="fas fa-check-circle success-icon"></i>
            <h2 class="font-weight-bold mb-3">Thanh Toán Thành Công!</h2>
            <p class="text-muted">Cảm ơn bạn đã tin tưởng dịch vụ của chúng tôi. Đơn hàng của bạn đang được xử lý.</p>
            <hr>
            <div class="text-left mb-4">
                <p><strong>Mã đơn hàng:</strong> ${orderId}</p>
                <p><strong>Mã giao dịch:</strong> ${transactionId}</p>
                <p>
                    <strong>Số tiền:</strong>
                    <fmt:formatNumber value="${totalPrice / 100}" pattern="#,### ₫"/>
                </p>
            </div>
            <a href="/" class="btn btn-success-custom btn-lg btn-block">Quay lại trang chủ</a>
        </div>
    </div>
</div>

