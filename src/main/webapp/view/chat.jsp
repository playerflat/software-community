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
    <%@include file="../module/header.jsp" %>
    <%@include file="../module/session.jsp" %>
    <script src="../ajax/MessageSubscriber.js"></script>
    <script src="../ajax/GroupSubscriber.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css"
          rel="stylesheet">

    <!------ Include the above in your HEAD tag ---------->
    <link href="../library/css/admin.css" rel="stylesheet">
</head>
<%! String groupName = "얍얍"; %>


<body id="page-top">
<!-- Nav -->
<%@include file="../module/nav.jsp" %>

<div id="wrapper">
    <!-- Sidebar -->
    <%@include file="../module/sidebar.jsp" %>

    <div class="container">
        <h3 class=" text-center">CBNU Community</h3>
        <div class="messaging">
            <div class="inbox_msg">
                <div class="inbox_people">
                    <div class="headind_srch">
                        <div class="recent_heading">
                            <h4>Group</h4>
                        </div>
                        <div class="srch_bar">
                            <div class="stylish-input-group">
                                <input type="text" class="search-bar" placeholder="Search">
                                <span class="input-group-addon">
                <button type="button"> <i class="fa fa-search" aria-hidden="true"></i> </button>
                </span></div>
                        </div>
                    </div>
                    <div class="inbox_chat" id = "groupList">
                        <%--<div class="chat_list active_chat" style="cursor: pointer">--%>
                            <%--<div class="chat_people">--%>
                                <%--<div class="chat_ib">--%>
                                    <%--<h5>ChoiJH <span class="chat_date">Dec 27</span></h5>--%>
                                    <%--<p>CBNU SoftwareEngineering student</p>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                                <script>groupLoadSubscriber()</script>
                    </div>
                </div>

                <div class="mesgs">
                    <form>
                        <div class="msg_history" id = "chatList">
                            <%--<div class="outgoing_msg">--%>
                                <%--<div class="sent_msg">--%>
                                    <%--<h7>강민구</h7>--%>
                                    <%--<p>Test which is a new approach to have all--%>
                                        <%--solutions</p>--%>
                                    <%--<span class="time_date"></span></div>--%>
                            <%--</div>--%>
                        </div>

                    <input type="hidden" id = "sent_name" value="<%=session.getAttribute("name")%>">
                    <input type="hidden" id = "sent_groupName" value= "<%=groupName%>" />
                        <div class="type_msg">
                            <div class="input_msg_write form-group">
                                <input type="text" class="write_msg" id="sent_contents" placeholder="Type a message"/>

                                <button class="msg_send_btn" type="button" onclick="messageWriteSubscriber()"><i
                                        class="fa fa-paper-plane-o"
                                        aria-hidden="true"></i></button>
                            </div>
                        </div>
                    </form>
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

</body>
</html>
