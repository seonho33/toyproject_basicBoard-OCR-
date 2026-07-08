<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header class="header">

    <c:choose>
        <c:when test="${not empty sessionScope.member}">
            <span>${sessionScope.member.userName}님</span>
            <a href="/member/logout" class="btn secondary">
                로그아웃
            </a>
        </c:when>

        <c:otherwise>
            <a href="/member/login" class="btn secondary">
                로그인
            </a>

            <a href="/member/register" class="btn">
                회원가입
            </a>
        </c:otherwise>
    </c:choose>

</header>