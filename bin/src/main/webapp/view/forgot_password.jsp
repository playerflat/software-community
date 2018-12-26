<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">

<head>

    <%@include file="../module/header.jsp" %>
    <div class="card-title" style="margin-top:10%;">
        <h2 class="card-title text-center" style="color:#ffffff;">전북대학교 소프트웨어공학과</h2>
    </div>
    <script src="../ajax/ResetSubscriber.js"></script>
</head>

<body class="bg-dark">
<div class="container">
    <div class="card card-login mx-auto mt-5">
        <div class="card-header">비밀번호 초기화</div>
        <div class="card-body">
            <div class="text-center mb-4">
                <h4>비밀번호를 잊어버리셨습니까?</h4>
                <p>비밀번호를 재설정 하세요!</p>
            </div>
            <div class="form-group">
                <div class="form-label-group">
                    <input type="text" name="stdNumber" id="stdNumber" class="form-control"
                           placeholder="Enter student number"
                           required="required" autofocus="autofocus">
                    <label for="stdNumber">학번 입력</label>
                </div>
            </div>
            <div class="form-group">
                <div class="form-label-group">
                    <input type="email" name="email" id="email" class="form-control"
                           placeholder="Enter email address"
                           required="required" autofocus="autofocus">
                    <label for="email">이메일 입력</label>
                </div>
            </div>
            <div class="form-group">
                <div class="form-label-group">
                    <input type="text" name="name" id="name" class="form-control"
                           placeholder="Enter name"
                           required="required" autofocus="autofocus">
                    <label for="name">이름 입력</label>
                </div>
            </div>
            <button class="btn btn-primary btn-block0" type="button"
                    onclick="forgotSubscribe()">
                인증메일 발송하기
            </button>
            <div class="text-center">
                <a class="d-block small mt-3" href="terms.jsp">회원가입</a>
                <a class="d-block small" href="sign_in.jsp">로그인</a>
            </div>
        </div>
    </div>
</div>


<!-- Bootstrap core JavaScript-->
<script src="../library/vendor/jquery/jquery.min.js"></script>
<script src="../library/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="../library/vendor/jquery-easing/jquery.easing.min.js"></script>
</body>
</html>