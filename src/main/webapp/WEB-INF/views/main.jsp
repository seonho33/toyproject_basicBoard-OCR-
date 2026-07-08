<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>PDF 게시판</title>
    <style>
        .board-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        h1 {
            margin: 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 14px 12px;
            border-bottom: 1px solid #e5e7eb;
            text-align: left;
        }

        th {
            background: #f8fafc;
            color: #475569;
        }

        .title-link {
            color: #1f2937;
            text-decoration: none;
        }

        .title-link:hover {
            text-decoration: underline;
        }

        .empty {
            padding: 40px;
            text-align: center;
            color: #64748b;
        }
    </style>

    <jsp:include page="/WEB-INF/views/common/head.jsp" />
</head>

<body>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<main class="container">
    <div class="board-top">
        <h1>PDF 게시판</h1>
        <button id="writeBtn">글쓰기</button>
    </div>

    <table>
        <thead>
        <tr>
            <th style="width: 80px;">번호</th>
            <th>제목</th>
            <th style="width: 160px;">작성자</th>
            <th style="width: 160px;">작성일</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${empty pageVO.itemList}">
                <tr>
                    <td colspan="4" class="empty">등록된 게시글이 없습니다.</td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach var="board" items="${pageVO.itemList}">
                    <tr>
                        <td>${board.boardNo}</td>
                        <td>
                            <a href="/board/detail/${board.boardNo}" class="title-link">
                                ${board.title}
                            </a>
                        </td>
                        <td>${board.writerName}</td>
                        <td>${board.createdAt}</td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
    <div id="pagination"></div>
</main>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script>
$(function(){

    const $writeBtn = $("#writeBtn");

    $writeBtn.on("click", function(){

        <c:choose>
            <c:when test="${empty sessionScope.member}">
                alert("로그인 후 이용 가능합니다.");
                location.href = "/member/login";
                return;
            </c:when>

            <c:otherwise>
                location.href = "/board/write";
            </c:otherwise>
        </c:choose>

    });

});
</script>

</body>
</html>