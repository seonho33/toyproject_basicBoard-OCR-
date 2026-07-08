<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/views/common/head.jsp" />
    <title>게시글</title>

    <style>
        .board-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 24px;
        }

        .board-meta {
            display: flex;
            gap: 16px;
            margin-bottom: 20px;
            color: #64748b;
            font-size: 14px;
        }

        .board-content {
            min-height: 300px;
            padding: 20px;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            background: #ffffff;
            white-space: pre-wrap;
            line-height: 1.6;
        }
    </style>
</head>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<main class="container">
    <div class="board-top">
        <h1><c:out value="${boardVO.boardTitle}" /></h1>
        <a href="/board/main" class="btn secondary">목록으로</a>
    </div>

    <div class="board-meta">
        <span>번호 : ${boardVO.boardNo}</span>
        <span>작성자 : <c:out value="${boardVO.boardWriter}" /></span>
        <span>작성일 : ${boardVO.boardRegDate}</span>
        <c:if test="${not empty boardVO.boardUpdDate}">
            <span>수정일 : ${boardVO.boardUpdDate}</span>
        </c:if>
    </div>

    <div class="board-content">
        <c:out value="${boardVO.boardContent}" />
    </div>
</main>

</body>
</html>