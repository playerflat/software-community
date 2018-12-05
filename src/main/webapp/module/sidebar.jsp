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


<body><ul class="sidebar navbar-nav">
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
        <a class="nav-link" href="../view/community_board.jsp">
            <i class="fas fa-fw fa-sticky-note"></i>
            <span>Community</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="../view/notice_board.jsp">
            <i class="fas fa-fw fa-bullhorn"></i>
            <span>Notice</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="../view/magazine_board.jsp">
            <i class="fas fa-fw fa-film"></i>
            <span>SE Magazine</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="../view/chat.jsp">
            <i class="fas fa-fw fa-comments"></i>
            <span>Messenger</span></a>
    </li>
</ul>
<%@include file="../view/logoutmodel.jsp"%>
</body>
</html>
