function forgotSubscribe() {
    let req = new XMLHttpRequest();
    req.onreadystatechange = function () {
        if (req.readyState === 4 && req.status === 200) {
            const json = JSON.parse(this.responseText);
            if (json[0] === true) {
                alert("인증메일을 발송하였습니다.");
                location.href = "sign_in.jsp";
            } else {
                alert("사용자 인증에 실패하였습니다.")
            }
        }
    };
    req.open("post", "http://localhost:1234/forgot.do"
        + "?stdNumber="
        + encodeURIComponent(document.getElementById("stdNumber").value)
        + "&name="
        + encodeURIComponent(document.getElementById("name").value)
        + "&email="
        + encodeURIComponent(document.getElementById("email").value)
        , true);
    req.send(null);
}

function resetSubscribe() {
    let req = new XMLHttpRequest();
    req.onreadystatechange = function () {
        if (req.readyState === 4 && req.status === 200) {
            const json = JSON.parse(this.responseText);
            if (json[0] === true) {
                alert("비밀번호 변경에 성공했습니다.");
                location.href = "sign_in.jsp";
            } else {
                alert("비밀번호 변경에 실패했습니다.")
            }
        }
    };
    req.open("post", "http://localhost:1234/reset.do"
        + "?stdNumber="
        + encodeURIComponent(document.getElementById("stdNumber").value)
        + "&password="
        + encodeURIComponent(document.getElementById("password").value)
        , true);
    req.send(null);
}