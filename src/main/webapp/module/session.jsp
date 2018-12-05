<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<body>
<%
    if (session.getAttribute("stdNumber") == null ||
            session.getAttribute("name") == null ||
            session.getAttribute("email") == null) {%>
<script>
    alert("세션이 만료되었습니다.");
    location.href = "sign_in.jsp";
</script>
<%
    } else {
        session.setAttribute("stdNumber", session.getAttribute("stdNumber"));
        session.setAttribute("name", session.getAttribute("name"));
        session.setAttribute("email", session.getAttribute("email"));
        session.setMaxInactiveInterval(60 * 60);
    }
%>
</body>
</html>