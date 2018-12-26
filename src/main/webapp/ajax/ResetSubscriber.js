function trimById(elementId) {
    document.getElementById(elementId).value = document.getElementById(elementId).value.trim();
    return document.getElementById(elementId)
}

function forgotSubscribe() {
    let stdNumber = trimById("stdNumber");
    let name = trimById("name");
    let email = trimById("email");

    if (stdNumber.value !== "" &&
        name.value !== "" &&
        email.value !== "") {
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
        req.open("post", "http://namsu.site:9891/forgot_password.do"
            + "?stdNumber="
            + encodeURIComponent(document.getElementById("stdNumber").value)
            + "&name="
            + encodeURIComponent(document.getElementById("name").value)
            + "&email="
            + encodeURIComponent(document.getElementById("email").value)
            , true);
        req.send(null);
    } else {
        alert("모든 항목을 입력해주세요")
    }
}

function resetPasswordSubscribe() {
    let password = trimById("password");
    let passwordChecker = trimById("passwordChecker");

    if (password.value !== "" && passwordChecker.value !== "") {
        if (password.value === passwordChecker.value) {
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
            req.open("post", "http://namsu.site:9891/reset_password.do"
                + "?stdNumber="
                + encodeURIComponent(document.getElementById("stdNumber").value)
                + "&password="
                + encodeURIComponent(document.getElementById("password").value)
                , true);
            req.send(null);
        }
        else {
            alert("비밀번호가 일치하지 않습니다");
        }
    } else {
        alert("모든 항목을 입력해주세요");
    }
}


function resetEmailSubscribe() {
    let email = trimById("resetEmail");

    if (email.value !== "") {
        let req = new XMLHttpRequest();
        req.onreadystatechange = function () {
            if (req.readyState === 4 && req.status === 200) {
                const json = JSON.parse(this.responseText);
                if (json[0] === true) {
                    alert("회원 정보가 변경되었습니다.\n다시 로그인 해주시기 바랍니다.");
                    location.href = "sign_in.jsp"
                } else {
                    alert("회원 정보 변경에 실패했습니다.")
                }
            }
        };


        req.open("post", "http://namsu.site:9891/reset_email.do"
            + "?stdNumber="
            + encodeURIComponent(document.getElementById("settings_stdNumber").value)
            + "&email="
            + encodeURIComponent(document.getElementById("resetEmail").value)
            , true);
        req.send(null);
    } else {
        alert("모든 항목을 입력해주세요");
    }
}