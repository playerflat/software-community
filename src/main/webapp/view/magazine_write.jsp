<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="session_checker.jsp" %>

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">
    <link href="css/write.css" rel="stylesheet">

    <script src="../core/subscriber/MagazineSubscriber.js"></script>
</head>
<body id="page-top">
<!-- Nav -->
<%@include file="nav.jsp" %>

<div id="wrapper">
    <!-- Sidebar -->
    <%@include file="sidebar.jsp" %>
    <div id="content-wrapper">
        <div class="container-fluid">

            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">SE Magazine</a>
                </li>
            </ol>
            </td>
            <!-- DataTables Example -->
            <div class="card-header">
                <i class="fas fa-fw fa-film"></i>
                SE Magazine
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <form method="post">
                        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered"
                               id="example">
                            <tbody>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" placeholder="글 제목" name="magazine_title" id="magazine_title">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                <textarea class="form-control" placeholder="글 내용" name="magazine_contents"
                                          maxlength="2048"
                                          style="height: 350px;" id="magazine_contents"></textarea>

                                    <input type="hidden" class="form-control" id="magazine_stdNumber"  name="magazine_stdNumber" value="<%=session.getAttribute("stdNumber")%>">
                                    <input type="hidden" class="form-control" id="magazine_name" name="magazine_name" value="<%=session.getAttribute("name")%>">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <button type="button" class="float-right btn btn-secondary">취소</button>
                        <button type="button" class="float-right btn btn-primary"
                                onclick="magazineWriteSubscribe()">등록
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>


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