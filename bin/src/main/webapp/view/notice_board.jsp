<%--
  Created by IntelliJ IDEA.
  User: gangmingu
  Date: 13/11/2018
  Time: 12:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../module/header.jsp" %>
    <%@include file="../module/session.jsp" %>
    <link href="../library/css/noticeboard.css" rel="stylesheet">
    <script src="../ajax/NoticeSubscriber.js"></script>
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
                    <a href="#">공지사항</a>
                </li>
            </ol>

            <div class="card-header">
                <i class="fas fa-fw fa-bullhorn"></i>
                공 지 사 항
                <script> noticeLoadSubscribe();</script>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table cellpadding="0" cellspacing="0" border="0"
                           class="table table-bordered" style="font-size: 10px">
                        <thead>
                        <tr>
                            <th scope="col" style="text-align: center; width: 45px; ">번호</th>
                            <th scope="col" style="text-align: center; width: auto;">공지사항</th>
                            <th scope="col" style="text-align: center; width: 77px;">작성일</th>
                        </tr>
                        </thead>
                        <table cellpadding="0" cellspacing="0" border="0"
                               id="noticeTable" class="table table-bordered" style="font-size: 10px">
                            <tbody>
                            </tbody>
                        </table>
                    </table>
                </div>
            </div>
        </div>
        <br>
        <input type="hidden" value="<%=session.getAttribute("stdNumber")%>" id="notice_stdNumber"
               name="notice_stdNumber">

        <button type="button" class="float-right btn btn-primary" style="width: 20%; margin-right: 1%; margin-top: 1%"
                onclick="noticeCheckSubscribe()">글쓰기
        </button>
        <div>
            <div class="card-footer small text-muted" style="height: 65px;"></div>
        </div>
    </div>


    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Bootstrap core JavaScript-->
    <script src="../library/vendor/jquery/jquery.min.js"></script>
    <script src="../library/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../library/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Page level plugin JavaScript-->
    <script src="../library/vendor/chart.js/Chart.min.js"></script>
    <script src="../library/vendor/datatables/jquery.dataTables.js"></script>
    <script src="../library/vendor/datatables/dataTables.bootstrap4.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../library/js/sb-admin.min.js"></script>

    <!-- Demo scripts for this page-->
    <script src="../library/js/demo/datatables-demo.js"></script>
    <script src="../library/js/demo/chart-area-demo.js"></script>

    <script src="../library/js/noticeboard.js"></script>

</body>
</html>
