<%--suppress ALL --%>
<%--
  Created by IntelliJ IDEA.
  User: Jeong-yoon
  Date: 28/11/2018
  Time: 10:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <%@include file="header.jsp"%>
</head>
<body>
<div class="list-group"><!--버튼식-->
    <a href="#" class="list-group-item active"><i class="fas fa-address-card"> </i>  Profile</a><!--파란창임-->
    <a href="reset_password.jsp" class="list-group-item"><i class="fas fa-key"> </i>  비밀번호 재설정</a>
    <a href="#" class="list-group-item"><i class="fas fa-cog"> </i> 설정</a>
    <a href="#" class="list-group-item"><i class="fas fa-comment-alt"> </i>  문의하기</a>
    <a href="#" class="list-group-item"><i class="far fa-clipboard"> </i>  개발자 노트</a>
</div>
    <ul class="list-group">
        <li class="list-group-item">Cras justo odio</li>
        <li class="list-group-item">Dapibus ac facilisis in</li>
    <li class="list-group-item">Morbi leo risus</li>
    <li class="list-group-item">Porta ac consectetur ac</li>
    <li class="list-group-item">Vestibulum at eros</li>
</ul>    <!-- Bootstrap core JavaScript-->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Page level plugin JavaScript-->
    <script src="../vendor/chart.js/Chart.min.js"></script>
    <script src="../vendor/datatables/jquery.dataTables.js"></script>
    <script src="../vendor/datatables/dataTables.bootstrap4.js"></script>

    <!-- Custom scripts for all pages-->

    <script src="../js/sb-admin.min.js"></script>
    <script src="../web/vendor/bootstrap/js/settings.js"></script>
    <!-- Demo scripts for this page-->
    <script src="../js/demo/datatables-demo.js"></script>
    <script src="../js/demo/chart-area-demo.js"></script>

</body>
</html>
