<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<form:form>
    <div class="input-group w-100 mx-auto d-flex mb-4">
        <form:input type="search" class="form-control p-3" placeholder="keywords"
                    aria-describedby="search-icon-1" path="productName"/>
        <button id="search-icon-1" class="input-group-text p-3" type="submit"><i class="fa fa-search"></i></button>
    </div>
</form:form>