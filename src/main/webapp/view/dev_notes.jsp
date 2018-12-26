<%--
  Created by IntelliJ IDEA.
  User: Jeong-yoon
  Date: 01/12/2018
  Time: 5:35 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../module/header.jsp"%>
    <%@include file="../module/session.jsp" %>
    <link href="../library/css/settings.css" rel="stylesheet" id="bootstrap-css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body id="page-top">
<!-- Nav -->
<%@include file="../module/nav.jsp"%>
<div id="wrapper">
    <!-- Sidebar -->
    <%@include file="../module/sidebar.jsp"%>
    <!-- Contents -->
    <div style = "padding: 30px 0px 2px 3px;"></div>
    <div class="container" style="margin-top: 50px;">
        <div class="row flex-lg-nowrap">
            <div class="col-12 col-lg-auto mb-3" style="width: 200px;">
                <div class="card p-3">
                    <div class="e-navlist e-navlist--active-bg">
                        <ul class="nav">
                            <li class="nav-item"><a class="nav-link px-2 active" href="settings.jsp"><i class="far fa-fw fa-user-circle mr-1"></i><span>Profile</span></a></li>
                            <li class="nav-item"><a class="nav-link px-2" href="reset_password.jsp"><i class="fa fa-fw fa-key mr-1"></i><span>PW Reset</span></a></li>
                            <li class="nav-item"><a class="nav-link px-2" href="contact_us.jsp"><i class="far fa-fw fa-address-book mr-1"></i><span>Contact</span></a></li>
                            <li class="nav-item"><a class="nav-link px-2" href="dev_notes.jsp"><i class="far fa-fw fa-sticky-note mr-1"></i><span>Dev Notes</span></a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="row">
                    <div class="col mb-3">
                        <div class="card" style="width: 40rem;">
                            <div class="card-header">개발자 노트</div>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">1.1.1. Team Mingus</li>
                                <li class="list-group-item">1.1.0. Version 1.0</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>


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
<script src="../library/vendor/bootstrap/js/settings.js"></script>
<!-- Demo scripts for this page-->
<script src="../library/js/demo/datatables-demo.js"></script>
<script src="../library/js/demo/chart-area-demo.js"></script>
</body>
</html>