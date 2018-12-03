<%@ page import="site.namsu.sweng.util.SessionUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<body>
<%if (!SessionUtil.check(session, "stdNumber") || !SessionUtil.check(session, "name")) {%>
<script>
    alert("세션이 만료되었습니다.");
    location.href = "sign_in.jsp";
</script>
<%}%>
</body>
</html>