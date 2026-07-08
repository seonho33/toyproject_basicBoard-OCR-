<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="/css/common.css">
</head>

<body>
<header class="header">
    <button type="button" id="listBtn" class="btn secondary">목록으로</button>
</header>

<main class="container" style="max-width:360px;">
    <h1 style="text-align:center;">로그인</h1>

    <c:if test="${not empty errorMessage}">
        <p style="color:#b91c1c; text-align:center;">
            <c:out value="${errorMessage}"/>
        </p>
    </c:if>

    <form id="loginForm" method="post" action="${pageContext.request.contextPath}/member/login">
        <p>아이디</p>
        <input type="text" id="userId" name="userId" class="input" required>

        <p>비밀번호</p>
        <input type="password" id="userPassword" name="userPassword" class="input" required>

        <div style="display:flex; gap:10px; margin-top:24px;">
            <button type="button" id="registerBtn" class="btn secondary" style="flex:1;">회원가입</button>
            <button type="submit" class="btn" style="flex:1;">로그인</button>
        </div>
    </form>
</main>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
$(function(){
    $("#listBtn").on('click',function(){
        window.location.href = "/board/main";
    })

    $("#registerBtn").on('click',function(){
        window.location.href = "/member/register"
    })

    $("#loginForm").on('submit',function(event){
        event.preventDefault();

        if(!$("#userId").val()){
            alert('아이디를 입력해주세요');
            return;
        }

        if(!$("#userPassword").val()){
            alert('비밀번호를 입력해주세요');
            return;
        }

        this.submit();
    })
})
</script>
</body>
</html>