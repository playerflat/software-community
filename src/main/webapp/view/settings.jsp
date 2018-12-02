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
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
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
        <div style = "padding: 30px 0px 2px 3px;"></div>
        <div class="container" style="margin-top: 50px;">
            <div class="row flex-lg-nowrap">
                <div class="col-12 col-lg-auto mb-3" style="width: 200px;">
                    <div class="card p-3">
                        <div class="e-navlist e-navlist--active-bg">
                            <ul class="nav">
                                <li class="nav-item"><a class="nav-link px-2 active" href="settings.jsp"><i class="far fa-fw fa-user-circle mr-1"></i><span>Profile</span></a></li>
                                <li class="nav-item"><a class="nav-link px-2" href="settingpw.jsp"><i class="fa fa-fw fa-key mr-1"></i><span>PW Reset</span></a></li>
                                <li class="nav-item"><a class="nav-link px-2" href="dev.jsp"><i class="far fa-fw fa-sticky-note mr-1"></i><span>Dev Notes</span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="row">
                        <div class="col mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="e-profile">
                                        <div class="row">
                                            <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
                                                <div class="text-center text-sm-left mb-2 mb-sm-0">
                                                    <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap">Iljjeong2</h4>
                                                    <p class="mb-0">@201646199</p>
                                                    <div class="text-muted"><small>2018.12.01 00:00:00(최종 로그인 시각)</small></div>
                                                </div>
                                                <div class="text-center text-sm-right">
                                                    <span class="badge badge-secondary">administrator</span>
                                                    <div class="text-muted"><small>Joined 09 Dec 2017</small></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-content pt-3">
                                            <div class="tab-pane active">
                                                <form class="form" novalidate="">
                                                    <div class="row">
                                                        <div class="col">
                                                            <form>
                                                            <div class="form-group col-md-4">
                                                                <label for="inputGrade">학년 선택</label>
                                                                <select id="inputGrade" class="form-control">
                                                                    <option selected>학년</option>
                                                                    <option>1학년</option>
                                                                    <option>2학년</option>
                                                                    <option>3학년</option>
                                                                    <option>4학년</option>
                                                                    <option>졸업생</option>
                                                                </select>
                                                            </div>
                                                            </form>
                                                            <form>
                                                                <div class="form-group row">
                                                                    <label for="staticEmail" class="col-sm-2 col-form-label">&nbsp;&nbsp; Email</label>
                                                                    <div class="col-sm-10">
                                                                        <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="email@example.com">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label for="staticEmail" class="col-sm-2 col-form-label">&nbsp;&nbsp; Change</label>
                                                                    <div class="col-sm-10">
                                                                        <input type="password" class="form-control" id="inputPassword" placeholder="New Email">
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col d-flex justify-content-end">
                                                            <button class="btn btn-primary" type="submit">저장하기</button>
                                                        </div>
                                                    </div>
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-3 mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <h6 class="card-title font-weight-bold">Support</h6>
                                    <p class="card-text">Test 안녕 연락주세요-★★★</p>
                                    <div class="btn btn-primary" type="button">
                                        <a href="contactus.jsp">Contactus</a>
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
