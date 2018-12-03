<%--
  Created by IntelliJ IDEA.
  User: Jeong-yoon
  Date: 01/12/2018
  Time: 6:45 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="header.jsp" %>
    <%@include file="session_checker.jsp" %>
    <link href="css/settings.css" rel="stylesheet" id="bootstrap-css">
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
            <a class="nav-link" href="community_board.jsp">
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
                <a class="nav-link" href="magazine.jsp">
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
        <div style="padding: 30px 0px 2px 3px;"></div>
        <div class="container" style="margin-top: 50px;">
            <div class="row flex-lg-nowrap">
                <div class="col-12 col-lg-auto mb-3" style="width: 200px;">
                    <div class="card p-3">
                        <div class="e-navlist e-navlist--active-bg">
                            <ul class="nav">
                                <li class="nav-item"><a class="nav-link px-2 active" href="settings.jsp"><i
                                        class="far fa-fw fa-user-circle mr-1"></i><span>Profile</span></a></li>
                                <li class="nav-item"><a class="nav-link px-2" href="settingpw.jsp"><i
                                        class="fa fa-fw fa-key mr-1"></i><span>PW Reset</span></a></li>
                                <li class="nav-item"><a class="nav-link px-2" href="dev.jsp"><i
                                        class="far fa-fw fa-sticky-note mr-1"></i><span>Dev Notes</span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="row">
                        <div class="col mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col mb-3">
                                            <div class="form-group">
                                                <label>To.Suppor team</label>
                                                <textarea class="form-control" rows="5"
                                                          placeholder="문의하실 내용을 적어주세요"></textarea>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col d-flex justify-content-end">
                                            <button class="btn btn-primary" href="contactus.jsp" type="submit">Contact
                                            </button>
                                        </div>
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
</body>