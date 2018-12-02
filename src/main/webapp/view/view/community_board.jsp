<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <%@include file="header.jsp" %>
    <!-- Bootstrap CSS -->
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"--%>
    <%--integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">--%>

    <!-- Page level plugin CSS-->
    <link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

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
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-fw fa-user-circle"></i>
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
                <!--<div class="dropdown-divider"></div>
                       <h6 class="dropdown-header">Other Pages</h6>

                       <a class="dropdown-item" href="404.html">404 Page</a>
                       <a class="dropdown-item" href="blank.html">Blank Page</a>
                       -->
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="chat.jsp">
                <i class="fas fa-fw fa-sticky-note"></i>
                <!--Charts-->
                <span>Community</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="notice_board.jsp">
                <i class="fas fa-fw fa-bullhorn"></i>
                <!--Tables-->
                <span>Notice</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="tables.jsp">
                <i class="fas fa-fw fa-film"></i>
                <!--Tables-->
                <span>SE Magazine</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="chat.jsp">
                <i class="fas fa-fw fa-comments"></i>
                <!--Tables-->
                <span>Messenger</span></a>
        </li>

    </ul>

    <div id="content-wrapper">
        <div class="container-fluid">

            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">커뮤니티 게시판</a>
                </li>
                <li class="breadcrumb-item active">전체보기</li>
            </ol>

            <div class="card mb-3">
                <div class="card-header">
                    <i class="fas fa-table"></i>
                    커뮤니티
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered border-white " id="dataTable" width="100%" cellspacing="0">
                            <thead>
                            <tr>
                                <th>커뮤니티</th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th>커뮤니티</th>
                            </tr>
                            </tfoot>
                            <tbody>
                            <%
                                int a = 10;
                                for (int i=0; i<a; i++){
                            %>
                            <tr class="table-borderless" bgcolor="#9370db">
                                <td> <!-- Icon Cards-->
                                    <div class="col-xl-9 col-sm-6 mb-3 mx-auto">
                                        <div class="card text-dark  o-hidden h-100">
                                            <div class="card-header">
                                                <h5 class="float-left card-title">주말엔 정환이와...</h5>
                                                <h5 class="float-right text-primary">2018-10-10 최정환</h5>
                                            </div>
                                            <div class="card-body">
                                                <div class="card-body-icon">
                                                    <i class="fas fa-fw fa-comments"></i>
                                                </div>
                                                <p class="card-text">나는..가끔...눈물이...난다...</p>
                                            </div>
                                            <a class="card-footer text-dark clearfix small z-1"
                                               href="community_board.jsp">
                                                <span class="float-left text-primary"></span>
                                                <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                                            </a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
            </div>
        </div>
        <!-- /.container-fluid -->

        <!-- Sticky Footer -->
        <footer class="sticky-footer">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright © Mingus 2018</span>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.content-wrapper -->

</div>
<!-- /#wrapper -->

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
                <button class="btn btn-secondary" type="button" data-dismiss="modal"> 취소</button>
                <a class="btn btn-primary"
                   onclick=<%session.invalidate();%>
                           href="sign_in.jsp">
                    로그아웃</a>
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
