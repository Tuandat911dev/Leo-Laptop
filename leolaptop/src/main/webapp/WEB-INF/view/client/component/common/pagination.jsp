<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-12 wow fadeInUp" data-wow-delay="0.1s">
    <div class="pagination d-flex justify-content-center mt-5">
        <a ${page == 1 ? 'style="pointer-events: none"' : ''} href="/shop?page=${page - 1}" class="rounded">&laquo;</a>
        <c:forEach begin="1" end="${totalPages}" var="i">
            <a href="/shop?page=${i}" class="${page == i ? 'active' : ''} rounded">${i}</a>
        </c:forEach>

        <a ${page == totalPages ? 'style="pointer-events: none"' : ''} href="/shop?page=${page + 1}" class="rounded">
            &laquo;</a>
    </div>
</div>