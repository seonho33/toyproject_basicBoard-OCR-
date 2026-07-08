<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>게시글 작성</title>

    <jsp:include page="/WEB-INF/views/common/head.jsp" />
</head>
<link rel="stylesheet" href="/css/common.css">
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<main class="container">
    <h1>게시글 작성</h1>

    <form action="/board/write" method="post" enctype="multipart/form-data">
        <p>제목</p>
        <input type="text" name="boardTitle" class="input">

        <p>글쓴이 ${sessionScope.member.userId}</p>

        <p>내용</p>
        <textarea name="boardContent" class="textarea"></textarea>

        <br><br>
        <input type="file" name="pdfFiles" multiple >
        <button type="submit" class="btn">등록</button>
        <a href="/board/main" class="btn secondary" >취소</a>
    </form>
</main>

<script>

</script>
</body>
</html>