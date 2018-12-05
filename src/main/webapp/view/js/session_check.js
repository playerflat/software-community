function sessionCheck(leftSession) {
    if (leftSession < 9999999) {
        alert("세션이 만료되었습니다.");
        location.href = "sign_in.jsp";
    }
}