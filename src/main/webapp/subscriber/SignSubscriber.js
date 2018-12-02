function signInSubscribe() {
    let req = new XMLHttpRequest();
    let count = 0;

    req.onreadystatechange = function () {
        if (req.readyState === 4 && req.status === 200 && count === 0) {
            const json = JSON.parse(this.responseText);
            if (json[0] != null) {
                location.href = "main.jsp";
            } else {
                alert("로그인에 실패하였습니다.")
            }
            count++;
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