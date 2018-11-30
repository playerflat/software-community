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
    <%@include file="header.jsp" %>
    <!-- Bootstrap core CSS-->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <!-- Custom fonts for this template-->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../css/sb-admin.css" rel="stylesheet">

    <title>CBNU Software Engineering</title>
</head>
<style>
    /*    --------------------------------------------------
	:: General
	-------------------------------------------------- */

    .content h1 {
        text-align: center;
    }

    .content .content-footer p {
        color: #6d6d6d;
        font-size: 12px;
        text-align: center;
    }

    .content .content-footer p a {
        color: inherit;
        font-weight: bold;
    }

    /*	--------------------------------------------------
        :: Table Filter
        -------------------------------------------------- */
    .panel {
        border: 1px solid #ddd;
        background-color: #fcfcfc;
    }

    .panel .btn-group {
        margin: 15px 0 30px;
    }

    .panel .btn-group .btn {
        transition: background-color .3s ease;
    }

    .table-filter {
        background-color: #fff;
        border-bottom: 1px solid #eee;
    }

    .table-filter tbody tr:hover {
        cursor: pointer;
        background-color: #eee;
    }

    .table-filter tbody tr td {
        padding: 10px;
        vertical-align: middle;
        border-top-color: #eee;
    }

    .table-filter tbody tr.selected td {
        background-color: #eee;
    }

    .table-filter tr td:first-child {
        width: 38px;
    }

    .table-filter tr td:nth-child(2) {
        width: 35px;
    }

    .ckbox {
        position: relative;
    }

    .ckbox input[type="checkbox"] {
        opacity: 0;
    }

    .ckbox label {
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
    }

    .ckbox label:before {
        content: '';
        top: 1px;
        left: 0;
        width: 18px;
        height: 18px;
        display: block;
        position: absolute;
        border-radius: 2px;
        border: 1px solid #bbb;
        background-color: #fff;
    }

    .ckbox input[type="checkbox"]:checked + label:before {
        border-color: #2BBCDE;
        background-color: #2BBCDE;
    }

    .ckbox input[type="checkbox"]:checked + label:after {
        top: 3px;
        left: 3.5px;
        content: '\e013';
        color: #fff;
        font-size: 11px;
        font-family: 'Glyphicons Halflings';
        position: absolute;
    }

    .table-filter .star {
        color: #ccc;
        text-align: center;
        display: block;
    }

    .table-filter .star.star-checked {
        color: #F0AD4E;
    }

    .table-filter .star:hover {
        color: #ccc;
    }

    .table-filter .star.star-checked:hover {
        color: #F0AD4E;
    }

    .table-filter .media-photo {
        width: 35px;
    }

    .table-filter .media-body {
        display: block;
        /* Had to use this style to force the div to expand (wasn't necessary with my bootstrap version 3.3.6) */
    }

    .table-filter .media-meta {
        font-size: 11px;
        color: #999;
    }

    .table-filter .media .title {
        color: #2BBCDE;
        font-size: 14px;
        font-weight: bold;
        line-height: normal;
        margin: 0;
    }

    .table-filter .media .title span {
        font-size: .8em;
        margin-right: 20px;
    }

    .table-filter .media .title span.pagado {
        color: #5cb85c;
    }

    .table-filter .media .title span.pendiente {
        color: #f0ad4e;
    }

    .table-filter .media .title span.cancelado {
        color: #d9534f;
    }

    .table-filter .media .summary {
        font-size: 14px;
    }
</style>
<script>
    $(document).ready(function () {

        $('.star').on('click', function () {
            $(this).toggleClass('star-checked');
        });

        $('.ckbox label').on('click', function () {
            $(this).parents('tr').toggleClass('selected');
        });

        $('.btn-filter').on('click', function () {
            var $target = $(this).data('target');
            if ($target != 'all') {
                $('.table tr').css('display', 'none');
                $('.table tr[data-status="' + $target + '"]').fadeIn('slow');
            } else {
                $('.table tr').css('display', 'none').fadeIn('slow');
            }
        });

    });
</script>

<body id="page-top">

<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars "></i>
    </button>

    <a class="navbar-brand mr-1" href="main.jsp">Software Engineering</a>

    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 <mr-md-2></mr-md-2> my-2 my-md-0">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Search for..." aria-label="Search"
                   aria-describedby="basic-addon2">
            <div class="input-group-append">
                <button class="btn btn-primary" type="button">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </div>
    </form>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
        <li class="nav-item dropdown no-arrow mx-1">
            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                <!-- <span class="badge badge-danger">999+</span>-->
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
                <a class="dropdown-item" href="#">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">Something else here</a>
            </div>
        </li>
        <li class="nav-item dropdown no-arrow mx-1">
            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-envelope fa-fw"></i>
                <!-- <span class="badge badge-danger">3</span> -->
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
                <a class="dropdown-item" href="#">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">Something else here</a>
            </div>
        </li>
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-user-circle fa-fw"></i>
                <!-- <span class="badge badge-danger">3</span> -->
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">Settings</a>
                <a class="dropdown-item" href="#">Activity Log</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
            </div>
        </li>
    </ul>

</nav>
<div id="wrapper">
    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
        <li class="nav-item active">
            <!-- 메인페이지-->
            <a class="nav-link" href="main.jsp">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <!--Dashboard-->
                <span>Main</span>
            </a>
        </li>
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-fw fa-folder"></i>
                <!--Pages-->
                <span>Information</span>

            </a>
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                <h6 class="dropdown-header">User Info</h6>
                <h7 class="dropdown-item-text"><%= session.getAttribute("stdNumber") %>
                </h7>
                <h7 class="dropdown-item-text"><%= session.getAttribute("name") %>
                </h7>

                <%--<a class="dropdown-item" href="../view/sign_in.jsp">Login</a>--%>
                <%--<a class="dropdown-item" href="../view/sign_up.jsp">Register</a>--%>
                <%--<a class="dropdown-item" href="#">Forgot Password</a>--%>
                <div class="dropdown-divider"></div>
                <h6 class="dropdown-header">Other Pages</h6>
                <!--
                <a class="dropdown-item" href="404.html">404 Page</a>
                <a class="dropdown-item" href="blank.html">Blank Page</a>
                -->
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="chat.jsp">
                <i class="fas fa-fw fa-comment"></i>
                <!--Charts-->
                <span>Community</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="notice_board.jsp">
                <i class="fas fa-fw fa-school"></i>
                <!--Tables-->
                <span>Notice</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="calendar.jsp">
                <i class="fas fa-fw fa-calendar"></i>
                <!--Tables-->
                <span>Calendar</span></a>
        </li>

    </ul>
    <div id="content-wrapper">
        <div class="container-fluid">

            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">공지사항</a>
                </li>
                <li class="breadcrumb-item active">게시판형testing</li>
            </ol>

            </td>
            <!-- DataTables Example -->
            <!-- <div class="card mb-3"> -->
            <div class="card-header">
                <i class="fas fa-table"></i>
                공!지!사!항!
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered"
                           id="dataTable" style="text-align: center;">

                        <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>조회수</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            int a = 20;
                            for (int i=0; i<a; i++){
                        %>
                        <tr>
                            <td>1</td>
                            <td>안녕</td>
                            <td>민구</td>
                            <td>2018.11.17.</td>
                            <td>1</td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                    <a href="write.jsp" class="btn btn-primary fa-pull-right">글쓰기</a>


                </div>
            </div>
        </div>

        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>

    </div>
</div>


    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">로그아웃 버튼을 누르면 세션이 종료됩니다.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal"> Cancel</button>
                <a class="btn btn-primary"
                   onclick=<%session.invalidate();%>
                           href="sign_in.jsp">
                    Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Page level plugin JavaScript-->
<script src="../vendor/chart.js/Chart.min.js"></script>
<script src="../vendor/datatables/jquery.dataTables.js"></script>
<script src="../vendor/datatables/dataTables.bootstrap4.js"></script>

<!-- Custom scripts for all pages-->
<script src="../js/sb-admin.min.js"></script>

<!-- Demo scripts for this page-->
<script src="../js/demo/datatables-demo.js"></script>
<script src="../js/demo/chart-area-demo.js"></script>
</body>
</html>
