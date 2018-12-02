<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">

<head>

    <%@include file="header.jsp"%>
    <div class="card-title" style="margin-top:10%;">
        <h2 class="card-title text-center" style="color:#ffffff;">전북대학교 소프트웨어공학과</h2>
    </div>

</head>

<body class="bg-dark">

<div class="container">
    <div class="card card-login mx-auto mt-5">
        <div class="card-header text-center">로그인</div>
        <div class="card-body">
            <form class="form-signin" action="${pageContext.request.contextPath}/server/sign_in" method="POST">
                <div class="form-group">
                    <div class="form-label-group">
                        <input type="text" id="inputText" name="stdNumber" class="form-control"
                               placeholder="Student Number" required="required" autofocus="autofocus">
                        <label for="inputText">학생 번호</label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-label-group">
                        <input type="password" id="inputPassword" name="password" class="form-control"
                               placeholder="Password" required="required">
                        <label for="inputPassword">비밀번호</label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="remember-me">
                            회원정보 저장
                        </label>
                    </div>
                </div>
                <button class="btn btn-primary btn-block" type="submit">로그인</button>
            </form>
            <div class="text-center">
                <a class="d-block small mt-3" href="terms.jsp">회원가입</a>
                <a class="d-block small" href="forgot_password.jsp">비밀번호 찾기</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

</body>

</html>
