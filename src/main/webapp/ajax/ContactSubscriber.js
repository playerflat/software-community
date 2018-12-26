function contactSubscribe() {
    let req = new XMLHttpRequest();
    req.onreadystatechange = function () {
        if (req.readyState === 4 && req.status === 200) {
            const json = JSON.parse(this.responseText);
            if (json[0] === true) {
                alert("문의메일을 발송하였습니다.");
                location.href = "main.jsp"
            } else {
                alert("메일 발송에 실패하였습니다.")
            }
        }
    };
    req.open("post", "http://namsu.site:9891/contact_us.do"
        + "?stdNumber="
        + encodeURIComponent(document.getElementById("contact_stdNumber").value)
        + "&name="
        + encodeURIComponent(document.getElementById("contact_name").value)
        + "&email="
        + encodeURIComponent(document.getElementById("contact_email").value)
        + "&msg="
        + encodeURIComponent(document.getElementById("contact_msg").value)
        , true);
    req.send(null);
}