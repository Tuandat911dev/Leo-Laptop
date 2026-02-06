<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>403 - Access Denied</title>

    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #ff416c, #ff4b2b);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
        }

        .error-box {
            background: #ffffff;
            color: #333;
            padding: 50px 40px;
            border-radius: 12px;
            text-align: center;
            max-width: 420px;
            width: 100%;
            box-shadow: 0 20px 40px rgba(0,0,0,0.2);
            animation: fadeIn 0.6s ease-in-out;
        }

        .error-code {
            font-size: 90px;
            font-weight: 800;
            color: #dc3545;
        }

        .error-icon {
            font-size: 48px;
            color: #dc3545;
            margin-bottom: 15px;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>

<div class="error-box">
    <div class="error-icon">
        <i class="fas fa-lock"></i>
    </div>
    <div class="error-code">403</div>
    <h4 class="mb-3">Access Denied</h4>
    <p class="text-muted mb-4">
        Bạn không có quyền truy cập vào trang này.<br>
        Vui lòng liên hệ quản trị viên nếu cần thiết.
    </p>

    <a href="/" class="btn btn-danger btn-lg mr-2">
        <i class="fas fa-home"></i> Trang chủ
    </a>
    <a href="javascript:history.back()" class="btn btn-outline-secondary btn-lg">
        Quay lại
    </a>
</div>

</body>
</html>
