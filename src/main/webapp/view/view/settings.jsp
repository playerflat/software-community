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
    <link href="../css/settings.css" rel="stylesheet" id="bootstrap-css">

</head>
<body>
<div id="page-top">

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
        <!-- Page Content -->
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="list-group">
                        <a href="#" class="list-group-item active" data-target-id="Category1">Category 1</a>
                        <a href="#" class="list-group-item" data-target-id="Category2">Category 2</a>
                        <a href="#" class="list-group-item" data-target-id="Category3">Category 3</a>
                    </div>
                </div>               <!-- /.col-lg-3 -->
                <div class="col-lg-9">
                    <div class="card mt-4">
                        <div class="card card-outline-secondary my-4" id="Category1">
                            <div class="card-header">
                                Product Reviews
                            </div>
                            <div class="card-body">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
                                <small class="text-muted">Posted by Anonymous on 3/1/17</small>
                                <hr>
                                <a href="#" class="btn btn-success">Leave a Review</a>
                            </div>
                        <!-- /.card -->
                        </div>
                    </div>
                <div class="col-lg-9">
                    <div class="card mt-4">
                         <div class="card card-outline-secondary my-4" id="Category2">
                             <div class="card-header">
                                        Product Reviews
                             </div>
                             <div class="card-body">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
                                 <small class="text-muted">Posted by Anonymous on 3/1/17</small>
                                        <hr>
                                 <a href="#" class="btn btn-success">Leave a Review</a>
                             </div>
                             <div class="card-body">

                             </div>
                                    <!-- /.card -->
                         </div>

                    </div>
                    <!-- /.col-lg-9 -->
                </div>
            </div>
            <!-- /.container -->
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
    <script src="../web/vendor/bootstrap/js/settings.js"></script>
    <!-- Demo scripts for this page-->
    <script src="../js/demo/datatables-demo.js"></script>
    <script src="../js/demo/chart-area-demo.js"></script>

    <script src="../js/settings.js"></script>

    <script src="../4.1.1/js/bootstrap.min.js"></script>
    <script src="../jquery/3.2.1/jquery.min.js"></script>
</div>
</body>
</html>
