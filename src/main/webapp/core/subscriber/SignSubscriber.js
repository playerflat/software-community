function signInSubscribe() {
    let req = new XMLHttpRequest();
    req.onreadystatechange = function () {
        if (req.readyState === 4 && req.status === 200) {
            const json = JSON.parse(this.responseText);
            if (json[0] != null) {
                location.href = "main.jsp";
            } else {
                alert("로그인에 실패하였습니다.")
            }
        }
    };
    req.open("post", "http://localhost:1234/sign_in.do"
        + "?stdNumber="
        + encodeURIComponent(document.getElementById("stdNumber").value)
        + "&password="
        + encodeURIComponent(document.getElementById("password").value)
        , true);
    req.send(null);
}

function signUpSubscribe() {
    let req = new XMLHttpRequest();
    req.onreadystatechange = function () {
        const json = JSON.parse(this.responseText);
        if (req.readyState === 4 && req.status === 200) {
            if (json[0] === true) {
                alert("회원가입에 성공했습니다.");
                location.href = "sign_in.jsp";
            } else {
                alert("중복학번 혹은 네트워크상태 불량입니다.")
            }
        }
    };
    req.open("post", "http://localhost:1234/sign_up.do"
        + "?stdNumber="
        + encodeURIComponent(document.getElementById("stdNumber").value)
        + "&name="
        + encodeURIComponent(document.getElementById("name").value)
        + "&email="
        + encodeURIComponent(document.getElementById("email").value)
        + "&password="
        + encodeURIComponent(document.getElementById("password").value)
        , true);
    req.send(null);
}