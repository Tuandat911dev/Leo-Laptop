<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-12 wow fadeInUp" data-wow-delay="0.1s">
    <div class="pagination d-flex justify-content-center mt-5">
        <c:choose>
            <c:when test="${page == 1}">
                <a href="/shop?page=1" class="rounded">&laquo;</a>
            </c:when>
            <c:otherwise>
                <a href="/shop?page=${page - 1}" class="rounded">&laquo;</a>
            </c:otherwise>
        </c:choose>


        <c:forEach begin="1" end="${totalPages}" var="i">
            <a href="/shop?page=${i}" class="${page == i ? 'active' : ''} rounded">${i}</a>
        </c:forEach>
        <c:choose>
            <c:when test="${page == totalPage}">
                <a href="/shop?page=totalPage" class="rounded">&laquo;</a>
            </c:when>
            <c:otherwise>
                <a href="/shop?page=${page + 1}" class="rounded">&raquo;</a>
            </c:otherwise>
        </c:choose>

    </div>
</div>
