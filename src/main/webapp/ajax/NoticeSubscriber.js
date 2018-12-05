function noticeLoadSubscribe() {
    let req = new XMLHttpRequest();
    req.onreadystatechange = function () {
        if (req.readyState === 4 && req.status === 200) {
            const resultText = this.responseText.substring(1, this.responseText.length - 1);
            const json = JSON.parse(resultText);
            const table = document.getElementById("noticeTable");
            table.innerHTML = "";

            for (let i = 0; i < json.length; i++) {
                let row = table.insertRow(0);
                let noticeNumber = row.insertCell(0);
                noticeNumber.innerHTML = json[i].noticeNumber;
                noticeNumber.style.width = '45px';
                noticeNumber.style.textAlign = 'center';

                let contents = row.insertCell(1);
                contents.innerHTML = json[i].contents;
                contents.style.width = 'auto';
                contents.style.textAlign = 'center';

                let date = row.insertCell(2);
                date.innerHTML = json[i].date;
                date.style.width = '77px';
                date.style.textAlign = 'center';
            }
        }
    };

    setInterval(function () {
        req.open("post", "http://localhost:1234/notice_load.do", true);
        req.send(null);
    }, 100);
}


function noticeCheckSubscribe() {
    let req = new XMLHttpRequest();
    req.onreadystatechange = function () {
        if (req.readyState === 4 && req.status === 200) {
            const json = JSON.parse(this.responseText);
            if (json[0] === true) location.href = "notice_write.jsp";
            else alert("관리자만 작성할 수 있습니다.")
        }
    };
    req.open("post", "http://localhost:1234/notice_check.do"
        + "?stdNumber="
        + encodeURIComponent(document.getElementById("notice_stdNumber").value)
        , true);
    req.send(null);
}


function noticeWriteSubscribe() {
    let req = new XMLHttpRequest();
    req.onreadystatechange = function () {
        if (req.readyState === 4 && req.status === 200) {
            const json = JSON.parse(this.responseText);
            if (json[0] === true) {
                alert("공지가 등록되었습니다.");
                location.href = "notice_board.jsp";
            } else alert("공지 작성에 실패하였습니다.")
        }
    };

    const today = new Date();
    const dd = today.getDate().toString();
    const mm = (today.getMonth() + 1).toString(); //January is 0!
    const yyyy = today.getFullYear().toString();
    req.open("post", "http://localhost:1234/notice_write.do"
        + "?contents="
        + encodeURIComponent(document.getElementById("notice_contents").value)
        + "&date="
        + yyyy + "/" + mm + "/" + dd
        , true);
    req.send(null);
}