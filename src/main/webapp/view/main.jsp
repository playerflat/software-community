<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <%@include file="../module/header.jsp" %>
    <%@include file="../module/session.jsp" %>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- Page level plugin CSS-->
    <link href="../library/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
</head>

<body id="page-top">
<!-- Nav -->
<%@include file="../module/nav.jsp"%>

<div id="wrapper">
    <!-- Sidebar -->
    <%@include file="../module/sidebar.jsp"%>
    <div id="content-wrapper">
        <div class="container-fluid">
            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">Main</a>
                </li>
                <li class="breadcrumb-item active">전체보기</li>
            </ol>

            <!-- Icon Cards-->
            <div class="row">
                <div class="col-xl-3 col-sm-6 mb-3">
                    <div class="card text-dark bg-primary o-hidden h-100">
                        <div class="card-body">
                            <div class="card-body-icon">
                                <i class="fas fa-fw fa-sticky-note"></i>
                            </div>
                            <div class="mr-5">커뮤니티</div>
                        </div>
                        <a class="card-footer text-dark clearfix small z-1" href="community_board.jsp">
                            <span class="float-left">자세히 보기</span>
                            <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                        </a>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 mb-3">
                    <div class="card text-dark bg-warning o-hidden h-100">
                        <div class="card-body">
                            <div class="card-body-icon">
                                <i class="fas fa-fw fa-bullhorn"></i>
                            </div>
                            <div class="mr-5">공지사항</div>
                        </div>
                        <a class="card-footer text-dark clearfix small z-1" href="notice_board.jsp">
                            <span class="float-left">자세히 보기</span>
                            <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                        </a>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 mb-3">
                    <div class="card text-dark bg-success o-hidden h-100">
                        <div class="card-body">
                            <div class="card-body-icon">
                                <i class="fas fa-fw fa-film"></i>
                            </div>
                            <div class="mr-5">SE 매거진</div>
                        </div>
                        <a class="card-footer text-dark clearfix small z-1" href="magazine_board.jsp">
                            <span class="float-left">자세히 보기</span>
                            <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                        </a>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 mb-3">
                    <div class="card text-dark bg-danger o-hidden h-100">
                        <div class="card-body">
                            <div class="card-body-icon">
                                <i class="fas fa-fw fa-comments"></i>
                            </div>
                            <div class="mr-5">채팅방</div>
                        </div>
                        <a class="card-footer text-dark clearfix small z-1" href="chat.jsp">
                            <span class="float-left">자세히 보기</span>
                            <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                        </a>
                    </div>
                </div>
            </div>

            <!-- Area Chart Example-->
            <div class="card mb-3">
                <div class="card-header">
                    <i class="fas fa-calendar"></i>
                    학사일정
                </div>
                <%@include file="../module/calendar.jsp"%>
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

</body>

</html>
