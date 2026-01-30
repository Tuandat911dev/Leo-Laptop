<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Electro - Electronics Website Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500;600;700&family=Roboto:wght@400;500;700&display=swap"
            rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/js/client/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/js/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/client/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/css/client/style.css" rel="stylesheet">
</head>

<body>

<!-- Spinner Start -->
<%@ include file="../component/spinner.jsp" %>
<!-- Spinner End -->


<!-- Topbar Start -->
<%@ include file="../component/header.jsp" %>
<!-- Topbar End -->

<!-- Navbar & Hero Start -->
<%@ include file="../component/navbar.jsp" %>
<!-- Navbar & Hero End -->

<%-- Content Start --%>
<jsp:include page="${contentPage}"/>
<%-- Content End --%>


<!-- Footer Start -->
<%@ include file="../component/footer.jsp" %>
<!-- Footer End -->


<!-- Copyright Start -->
<%@ include file="../component/copyright.jsp" %>
<!-- Copyright End -->


<!-- Back to Top -->
<%@ include file="../component/backToTop.jsp" %>


<!-- JavaScript Libraries -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/js/client/lib/wow/wow.min.js"></script>
<script src="/js/client/lib/owlcarousel/owl.carousel.min.js"></script>


<!-- Template Javascript -->
<script src="/js/client/main.js"></script>
</body>

</html>
