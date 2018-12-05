<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">

<head>

    <%@include file="../module/header.jsp" %>
    <script src="../ajax/SignSubscriber.js"></script>
    <div class="card-title" style="margin-top:10%;">
        <h2 class="card-title text-center" style="color:#ffffff;">전북대학교 소프트웨어공학과</h2>
    </div>
</head>

<body class="bg-dark">

<div class="container">
    <div class="card card-register mx-auto mt-5 col-md-6">
        <div class="card-header">회원가입</div>
        <div class="card-body">
            <form role="form" class=form-signup>
                <div class="form-group">
                    <div class="form-label-group">
                        <input type="text" id="stdNumber" name="stdNumber" class="form-control" placeholder="학생 번호"
                               required="required" autofocus="autofocus">
                        <label for="stdNumber">학생 번호</label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-label-group">
                        <input type="text" id="name" name="name" class="form-control" placeholder="이름"
                               required="required">
                        <label for="name">이름</label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-label-group">
                        <input type="email" id="email" name="email" class="form-control" placeholder="이메일"
                               required="required">
                        <label for="email">이메일</label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-label-group">
                        <input type="password" id="password" name="password" class="form-control" placeholder="비밀번호"
                               required="required">
                        <label for="password">비밀번호</label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-label-group">
                        <input type="password" id="confirmPassword" name="confirm-password" class="form-control"
                               placeholder="비밀번호 확인" required="required">
                        <label for="confirmPassword">비밀번호 확인</label>
                    </div>
                </div>
                <button class="btn btn-primary btn-block" type="button" onclick="signUpSubscribe()">
                    회원가입
                </button>
            </form>
            <div class="text-center">
                <a class="d-block small mt-3" href="sign_in.jsp">로그인</a>
                <a class="d-block small" href="forgot_password.jsp">비밀번호 찾기</a>
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
