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
    <link href="../css/write.css" rel="stylesheet">

    <title>Title</title>
</head>
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
            <a class="nav-link" href="#">
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
                    <form method="post" action="writeAction.jsp">
                        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
                            <thead>
                            <tr>
                                <th colspan="2">게시판 글쓰기 형식</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <textarea class="form-control" placeholder="글 내용" name="Content" maxlength="2048" style="height: 350px;"></textarea>
                                </td>
                            </tr>

                            </tbody>
                        </table>
                        <button type="button" class="float-right btn btn-secondary">취소</button>
                        <button type="button" class="float-right btn btn-primary">등록</button>
                       </form>
                </div>
            </div>
        </div>
    </div>

</div>


</div>
</div>
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