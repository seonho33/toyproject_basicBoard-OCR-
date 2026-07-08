<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>

    <link rel="stylesheet" href="/css/common.css">

    <style>
        .register-container {
            max-width: 520px;
        }

        .page-title {
            margin: 0 0 24px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 16px;
        }

        .form-group label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
            font-size: 14px;
        }

        .input-row {
            display: flex;
            gap: 8px;
            align-items: center;
        }

        .radio-row {
            display: flex;
            gap: 20px;
            padding: 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            background: #ffffff;
        }

        .birth-row {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 8px;
        }

        .phone-row {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .phone-prefix {
            padding: 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            background: #f3f4f6;
        }

        .button-row {
            display: flex;
            gap: 8px;
            margin-top: 24px;
        }

        .button-row .btn {
            flex: 1;
        }
    </style>
</head>

<body>
    <div class="container register-container">
        <h1 class="page-title">회원가입</h1>

        <form id="registerForm" action="/member/register" method="post">

            <div class="form-group">
                <label for="userId">아이디</label>
                <div class="input-row">
                    <input type="text" name="userId" id="userId" class="input" placeholder="아이디">
                    <input type="button" name="checkedId" id="checkedId" class="btn secondary" value="중복확인">
                </div>
            </div>

            <div class="form-group">
                <label for="userPassword">비밀번호</label>
                <input type="password" name="userPassword" id="userPassword" class="input" placeholder="비밀번호">
            </div>

            <div class="form-group">
                <label for="userName">이름</label>
                <input type="text" name="userName" id="userName" class="input" placeholder="이름">
            </div>

            <div class="form-group">
                <label>성별</label>
                <div class="radio-row">
                    <label>
                        <input type="radio" name="userGender" value="male">
                        남자
                    </label>
                    <label>
                        <input type="radio" name="userGender" value="female">
                        여자
                    </label>
                </div>
            </div>

            <div class="form-group">
                <label>생년월일</label>
                <div class="birth-row">
                    <select name="birthDateYear" id="birthDateYear" class="input">
                        <option value="">년도</option>
                        <c:forEach var="year" begin="1900" end="2026">
                            <option value="${year}">${year}</option>
                        </c:forEach>
                    </select>

                    <select name="birthDateMonth" id="birthDateMonth" class="input" disabled>
                        <option value="">월</option>
                    </select>

                    <select name="birthDateDay" id="birthDateDay" class="input" disabled>
                        <option value="">일</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label>전화번호</label>
                <div class="phone-row">
                    <span class="phone-prefix">010</span>
                    <span>-</span>
                    <input type="text" name="phone1" id="phone1" class="input" maxlength="4">
                    <span>-</span>
                    <input type="text" name="phone2" id="phone2" class="input" maxlength="4">
                </div>
            </div>

            <input type="hidden" id="userBirth" name="userBirth">
            <input type="hidden" id="userPhone" name="userPhone">

            <div class="button-row">
                <input type="submit" value="회원가입" id="submitBtn" class="btn">
                <input type="button" value="취소" class="btn secondary" onclick="window.location.href='/member/login'">
            </div>
        </form>
    </div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
$(function () {
    const registerForm = $('#registerForm');
    const birthDateYear = $('#birthDateYear');
    const birthDateMonth = $('#birthDateMonth');
    const birthDateDay = $('#birthDateDay');
    const checkedId = $('#checkedId');
    const inputUserId = $('#userId');

    let isUserIdChecked = false;

    inputUserId.on('input', function () {
        isUserIdChecked = false;
    });

    birthDateYear.on('change', function () {
        const selectedYear = parseInt(birthDateYear.val());

        birthDateMonth.empty().append('<option value="">월</option>');
        birthDateDay.empty().append('<option value="">일</option>').prop('disabled', true);

        if (isNaN(selectedYear)) {
            birthDateMonth.prop('disabled', true);
            return;
        }

        for (let month = 1; month <= 12; month++) {
            birthDateMonth.append(`<option value="\${month}">\${month}</option>`);
        }

        birthDateMonth.prop('disabled', false);
    });

    birthDateMonth.on('change', function () {
        const selectedYear = parseInt(birthDateYear.val());
        const selectedMonth = parseInt(birthDateMonth.val());

        birthDateDay.empty().append('<option value="">일</option>');

        if (isNaN(selectedYear) || isNaN(selectedMonth)) {
            birthDateDay.prop('disabled', true);
            return;
        }

        const daysInMonth = new Date(selectedYear, selectedMonth, 0).getDate();

        for (let day = 1; day <= daysInMonth; day++) {
            birthDateDay.append(`<option value="\${day}">\${day}</option>`);
        }

        birthDateDay.prop('disabled', false);
    });

    checkedId.on('click', function () {
        const userId = inputUserId.val().trim();

        if (!userId) {
            alert('아이디를 입력해주세요.');
            inputUserId.focus();
            return;
        }

        $.ajax({
            url: '/member/checkedId',
            type: 'GET',
            data: { userId: userId }
        }).done(function (exists) {
            if (exists) {
                alert('사용 불가능한 아이디입니다.');
                isUserIdChecked = false;
            } else {
                alert('사용 가능한 아이디입니다.');
                isUserIdChecked = true;
            }
        }).fail(function () {
            alert('중복 확인에 실패했습니다.');
        });
    });

    registerForm.on('submit', function (event) {
        event.preventDefault();

        const year = birthDateYear.val();
        const month = birthDateMonth.val();
        const day = birthDateDay.val();

        const phone1 = $('#phone1').val().trim();
        const phone2 = $('#phone2').val().trim();

        if (!isUserIdChecked) {
            alert('아이디 중복확인을 해주세요.');
            return;
        }

        if (!year || !month || !day) {
            alert('생년월일을 선택해 주세요.');
            return;
        }

        if (!phone1 || !phone2) {
            alert('전화번호를 입력해 주세요.');
            return;
        }

        $('#userBirth').val(
            year + '-' + month.padStart(2, '0') + '-' + day.padStart(2, '0')
        );

        $('#userPhone').val('010-' + phone1 + '-' + phone2);

        $.ajax({
            url: '/member/register',
            type: 'POST',
            data: registerForm.serialize()
        }).done(function () {
            alert('회원가입이 완료되었습니다.');
            window.location.href = '/';
        }).fail(function (xhr) {
            alert(xhr.responseText || '회원가입에 실패했습니다.');
        });
    });
});
</script>
</body>
</html>