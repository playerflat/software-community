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
        <div class="card-header">비밀번호 초기화</div>
        <div class="card-body">
            <div class="text-center mb-4">
                <h4>비밀번호를 잊어버리셨습니까?</h4>
                <p>비밀번호를 재설정 하세요!</p>
            </div>
            <form action="${pageContext.request.contextPath}/server/forgot" method="post">
                <div class="form-group">
                    <div class="form-label-group">
                        <input type="text" name="password" id="newpassword" class="form-control"
                               placeholder="새로운 비밀번호"
                               required="required" autofocus="autofocus">
                        <label for="newpassword">새로운 비밀번호</label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-label-group">
                        <input type="email" name="passwordChecker" id="passwordChecker" class="form-control"
                               placeholder="새로운 비밀번호 확인"
                               required="required" autofocus="autofocus">
                        <label for="passwordChecker">새로운 비밀번호 확인</label>
                    </div>
                </div>
                <button class="btn btn-primary btn-block0" type="submit">변경하기</button>
            </form>
            </div>
        </div>
    </div>
</div>

<!— Bootstrap core JavaScript—>
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!— Core plugin JavaScript—>
<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

</body>
</html>