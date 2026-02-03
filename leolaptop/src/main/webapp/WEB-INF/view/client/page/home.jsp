<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Carousel Start -->
<%@ include file="../component/home/carousel.jsp" %>
<!-- Carousel End -->

<!-- Services Start -->
<%@ include file="../component/common/service.jsp" %>
<!-- Services End -->

<!-- Products Offer Start -->
<%@ include file="../component/common/productOffer.jsp" %>
<!-- Products Offer End -->


<!-- Our Products Start -->
<jsp:include page="/WEB-INF/view/client/component/home/ourProduct.jsp"/>
<!-- Our Products End -->

<!-- Product Banner Start -->
<%@ include file="../component/common/productBanner.jsp" %>
<!-- Product Banner End -->

<!-- Product List Start -->
<jsp:include page="/WEB-INF/view/client/component/home/productList.jsp"/>
<!-- Product List End -->

<!-- Bestseller Products Start -->
<jsp:include page="/WEB-INF/view/client/component/home/bestSellerProduct.jsp"/>
<!-- Bestseller Products End -->
