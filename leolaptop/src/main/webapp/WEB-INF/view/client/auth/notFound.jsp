<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>404 - Page Not Found</title>

    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #141e30, #243b55);
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
            max-width: 440px;
            width: 100%;
            box-shadow: 0 20px 40px rgba(0,0,0,0.25);
            animation: fadeIn 0.6s ease-in-out;
        }

        .error-code {
            font-size: 100px;
            font-weight: 800;
            color: #6c757d;
        }

        .error-icon {
            font-size: 50px;
            color: #6c757d;
            margin-bottom: 15px;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(25px);
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
        <i class="fas fa-search"></i>
    </div>
    <div class="error-code">404</div>
    <h4 class="mb-3">Page Not Found</h4>
    <p class="text-muted mb-4">
        Trang bạn tìm không tồn tại<br>
        hoặc đã bị di chuyển.
    </p>

    <a href="/" class="btn btn-primary btn-lg mr-2">
        <i class="fas fa-home"></i> Trang chủ
    </a>
    <a href="javascript:history.back()" class="btn btn-outline-secondary btn-lg">
        Quay lại
    </a>
</div>

</body>
</html>
