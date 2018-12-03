<%--
  Created by IntelliJ IDEA.
  User: Jeong-yoon
  Date: 26/11/2018
  Time: 8:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="header.jsp" %>
    <%@include file="session_checker.jsp" %>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css"
          rel="stylesheet">

    <!------ Include the above in your HEAD tag ---------->
    <link href="css/admin.css" rel="stylesheet">
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


    <div class="container">
        <h3 class=" text-center">CBNU Community</h3>
        <div class="messaging">
            <div class="inbox_msg">
                <div class="inbox_people">
                    <div class="headind_srch">
                        <div class="recent_heading">
                            <h4>Recent</h4>
                        </div>
                        <div class="srch_bar">
                            <div class="stylish-input-group">
                                <input type="text" class="search-bar" placeholder="Search">
                                <span class="input-group-addon">
                <button type="button"> <i class="fa fa-search" aria-hidden="true"></i> </button>
                </span></div>
                        </div>
                    </div>
                    <div class="inbox_chat">
                        <div class="chat_list active_chat">
                            <div class="chat_people">
                                <div class="chat_ib">
                                    <h5>ChoiJH <span class="chat_date">Dec 27</span></h5>
                                    <p>CBNU SoftwareEngineering student</p>
                                </div>
                            </div>
                        </div>
                        <div class="chat_list">
                            <div class="chat_people">
                                <div class="chat_ib">
                                    <h5>MunJY <span class="chat_date">Dec 27</span></h5>
                                    <p>CBNU SoftwareEngineering student</p>
                                </div>
                            </div>
                        </div>
                        <div class="chat_list">
                            <div class="chat_people">
                                <div class="chat_ib">
                                    <h5>GoHU <span class="chat_date">Dec 26</span></h5>
                                    <p>CBNU SoftwareEngineering student</p>
                                </div>
                            </div>
                        </div>
                        <div class="chat_list">
                            <div class="chat_people">
                                <div class="chat_ib">
                                    <h5>Kangmingu <span class="chat_date">Dec 25</span></h5>
                                    <p>CBNU SoftwareEngineering student</p>
                                </div>
                            </div>
                        </div>
                        <div class="chat_list">
                            <div class="chat_people">
                                <div class="chat_ib">
                                    <h5>Sunil Rajput <span class="chat_date">Dec 25</span></h5>
                                    <p>Unknown USer Sunil Rajput lol </p>
                                </div>
                            </div>
                        </div>
                        <div class="chat_list">
                            <div class="chat_people">
                                <div class="chat_ib">
                                    <h5>Sunil Rajput <span class="chat_date">Dec 25</span></h5>
                                    <p>Unknown USer Sunil Rajput lol </p>
                                </div>
                            </div>
                        </div>
                        <div class="chat_list">
                            <div class="chat_people">
                                <div class="chat_ib">
                                    <h5>Sunil Rajput <span class="chat_date">Dec 25</span></h5>
                                    <p>Unknown USer Sunil Rajput lol </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mesgs">
                    <div class="msg_history">
                        <div class="incoming_msg">
                            <div class="received_msg">
                                <div class="received_withd_msg">
                                    <p>Hi, my name is CBNU!</p>
                                    <span class="time_date"> 11:11 AM    |    June 9</span></div>
                            </div>
                        </div>
                        <div class="outgoing_msg">
                            <div class="sent_msg">
                                <p>Test which is a new approach to have all
                                    solutions</p>
                                <span class="time_date"> 11:01 AM    |    June 9</span></div>
                        </div>
                        <div class="incoming_msg">
                            <div class="received_msg">
                                <div class="received_withd_msg">
                                    <p>Test, which is a new approach to have</p>
                                    <span class="time_date"> 11:01 AM    |    Yesterday</span></div>
                            </div>
                        </div>
                        <div class="outgoing_msg">
                            <div class="sent_msg">
                                <p>Mingus University, Korea Test</p>
                                <span class="time_date"> 11:01 AM    |    Today</span></div>
                        </div>
                        <div class="incoming_msg">
                            <div class="received_msg">
                                <div class="received_withd_msg">
                                    <p>web-programming.
                                        yeahh</p>
                                    <span class="time_date"> 11:01 AM    |    Today</span></div>
                            </div>
                        </div>
                    </div>
                    <div class="type_msg">
                        <div class="input_msg_write">
                            <input type="text" class="write_msg" placeholder="Type a message"/>
                            <button class="msg_send_btn" type="button"><i class="fa fa-paper-plane-o"
                                                                          aria-hidden="true"></i></button>
                        </div>
                    </div>
                </div>
            </div>
            <p class="text-center top_spac"> Design by <a target="_blank" href="#">Sunil Rajput</a></p>
        </div>
    </div>
</div>

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Page level plugin JavaScript-->
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="vendor/datatables/jquery.dataTables.js"></script>
<script src="vendor/datatables/dataTables.bootstrap4.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin.min.js"></script>

<!-- Demo scripts for this page-->
<script src="js/demo/datatables-demo.js"></script>
<script src="js/demo/chart-area-demo.js"></script>

</body>
</html>
