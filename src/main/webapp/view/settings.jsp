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
    <%@include file="../module/header.jsp"%>
    <%@include file="../module/session.jsp" %>
    <link href="../css/settings.css" rel="stylesheet" id="bootstrap-css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body id="page-top">
<!-- Nav -->
<%@include file="../module/nav.jsp"%>

<div id="wrapper">
    <!-- Sidebar -->
    <%@include file="../module/sidebar.jsp"%>
        <div style = "padding: 30px 0px 2px 3px;"></div>
        <div class="container" style="margin-top: 50px;">
            <div class="row flex-lg-nowrap">
                <div class="col-12 col-lg-auto mb-3" style="width: 200px;">
                    <div class="card p-3">
                        <div class="e-navlist e-navlist--active-bg">
                            <ul class="nav">
                                <li class="nav-item"><a class="nav-link px-2 active" href="settings.jsp"><i class="far fa-fw fa-user-circle mr-1"></i><span>Profile</span></a></li>
                                <li class="nav-item"><a class="nav-link px-2" href="reset_password.jsp"><i class="fa fa-fw fa-key mr-1"></i><span>PW Reset</span></a></li>
                                <li class="nav-item"><a class="nav-link px-2" href="dev_notes.jsp"><i class="far fa-fw fa-sticky-note mr-1"></i><span>Dev Notes</span></a></li>
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
                                                    <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap"><%=session.getAttribute("name")%></h4>
                                                    <p class="mb-0">@<%=session.getAttribute("stdNumber")%></p>
                                                </div>
                                                <div class="text-center text-sm-right">
                                                    <span class="badge badge-secondary">administrator</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-content pt-3">
                                            <div class="tab-pane active">
                                                <form class="form" novalidate="">
                                                    <div class="row">
                                                        <div class="col">
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
                                    <p class="card-text">개발자 문의</p>
                                    <div class="btn btn-primary" type="button">
                                        <a href="contact_us.jsp">Contactus</a>
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

<script src="/vendor/js/settings.js"></script>

<script src="/vendor/js/bootstrap.min.js"></script>
<script src="/vendor/jquery/jquery.min.js"></script>

</body>
</html>
