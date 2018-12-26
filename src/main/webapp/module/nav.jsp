<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <%@include file="header.jsp" %>
    <%@include file="session.jsp" %>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- Page level plugin CSS-->
    <link href="../library/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
</head>


<body>
<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars "></i>
    </button>

    <a class="navbar-brand mr-1" href="../view/main.jsp">Software Engineering</a>

    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 <mr-md-2></mr-md-2> my-2 my-md-0">
        <div class="input-group">
            <div class="input-group-append"></div>
        </div>
    </form>
    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-user-circle fa-fw"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="../view/settings.jsp">Settings</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" data-toggle="modal" data-target="#logoutModal">Logout</a>
            </div>
        </li>
    </ul>
</nav>

<!-- Logout Model-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">로그아웃 버튼을 누르면 세션이 종료됩니다.</div>
            <div class="modal-footer">
                <script> function logout() {
                    let req = new XMLHttpRequest();
                    req.onreadystatechange = function () {
                        if (req.readyState === 4 && req.status === 200) {
                            location.href = "sign_in.jsp";
                        }
                    };
                    req.open("post", "http://namsu.site:9891/sign_out.do");
                    req.send(null);
                }</script>
                <button class="btn btn-secondary" type="button" data-dismiss="modal"> 취소</button>
                <button class="btn btn-primary" id="logout" type="button"
                        onclick="logout()">로그아웃
                </button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
