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
    <%@include file="../module/header.jsp" %>
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
    <div style="padding: 30px 0px 2px 3px;"></div>
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
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col mb-3">
                                        <div class="form-group">
                                            <label>To.Suppor team</label>
                                            <textarea class="form-control" rows="5"
                                                      placeholder="문의하실 내용을 적어주세요."></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col d-flex justify-content-end">
                                        <button class="btn btn-primary" href="contactus.jsp" type="submit">Contact</button>
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
<!-- Sticky Footer -->
<footer class="sticky-footer">
    <div class="container my-auto">
        <div class="copyright text-center my-auto">
            <span>Copyright © Mingus 2018</span>
        </div>
    </div>
</footer>

<!-- /.content-wrapper -->

<!— Scroll to Top Button—>
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>


</body>
</html>