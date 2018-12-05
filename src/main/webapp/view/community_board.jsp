<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <%@include file="../module/header.jsp" %>
    <%@include file="../module/session.jsp" %>
    <script src="../ajax/BoardSubscriber.js"></script>
</head>
<body id="page-top">
<!-- Nav -->
<%@include file="../module/nav.jsp" %>

<div id="wrapper">
    <!-- Sidebar -->
    <%@include file="../module/sidebar.jsp" %>

    <div id="content-wrapper">

        <div class="container-fluid">

            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">SE Community</a>
                </li>
                <li class="breadcrumb-item active">커뮤니티</li>
            </ol>
            <!-- DataTables Example -->
            <div class="card-header">
                <i class="fas fa-fw fa-film"></i>
                Community
                <script>boardLoadSubscribe()</script>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table cellpadding="0" cellspacing="0" border="0"
                           class="table table-bordered" style="font-size: 10px">
                        <thead>
                        <tr>
                            <th scope="col" style="text-align: center; width: 45px; ">번호</th>
                            <th scope="col" style="text-align: center; width: 67px;">작성자</th>
                            <th scope="col" style="text-align: center; width: auto;">제목</th>
                            <th scope="col" style="text-align: center; width: auto;">내용</th>
                            <th scope="col" style="text-align: center; width: 77px;">작성일</th>
                        </tr>
                        </thead>
                        <table cellpadding="0" cellspacing="0" border="0"
                               id="communityTable" class="table table-bordered"  style="font-size: 10px">
                            <tbody>
                            </tbody>
                        </table>
                    </table>
                </div>
            </div>
        </div>
        <br>
        <input type="hidden" value="<%=session.getAttribute("stdNumber")%>" id="community_stdNumber" name="community_stdNumber">

        <button type="button" class="float-right btn btn-primary" style="width: 20%; margin-right: 1%; margin-top: 1%"
                onclick="location.href='community_write.jsp'">글쓰기
        </button>
        <div class="card-footer small text-muted" style="height: 65px;"></div>
    </div>
</div>
<p class="small text-center text-muted my-5">
    <em>More table examples coming soon...</em>
</p>
<!-- Sticky Footer -->
<footer class="sticky-footer">
    <div class="container my-auto">
        <div class="copyright text-center my-auto">
            <span>Copyright © Mingus 2018</span>
        </div>
    </div>
</footer>
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>


<!-- Bootstrap core JavaScript-->
<script src="../library/vendor/jquery/jquery.min.js"></script>
<script src="../library/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="../library/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Page level plugin JavaScript-->
<script src="../library/vendor/datatables/jquery.dataTables.js"></script>
<script src="../library/vendor/datatables/dataTables.bootstrap4.js"></script>

<!-- Custom scripts for all pages-->
<script src="../library/js/sb-admin.min.js"></script>

<!-- Demo scripts for this page-->
<script src="../library/js/demo/datatables-demo.js"></script>

</body>

</html>
