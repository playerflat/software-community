function boardReadSubscribe() {
    setInterval(function () {
        let req = new XMLHttpRequest();
        req.onreadystatechange = function () {
            if (req.readyState === 4 && req.status === 200) {
                const resultText = this.responseText.substring(1, this.responseText.length - 1);
                const json = JSON.parse(resultText);
                const table = document.getElementById("boardTable");
                table.innerHTML = "";

                for (let i = 0; i < json.length; i++) {
                    let row = table.insertRow(0);
                    let noticeNumber = row.insertCell(0);
                    noticeNumber.innerHTML = json[i].noticeNumber;
                    let contents = row.insertCell(1);
                    contents.innerHTML = json[i].contents;
                    let date = row.insertCell(2);
                    date.innerHTML = json[i].date;
                }
            }
        };
        req.open("post", "http://localhost:1234/board_read.do", true);
        req.send(null);
    }, 100);
}

function boardWriteSubscribe() {
    let req = new XMLHttpRequest();
    req.onreadystatechange = function () {
        if (req.readyState === 4 && req.status === 200) {
            const json = JSON.parse(this.responseText);
            if (json[0] === true) {
                alert("게시글이 등록되었습니다.");
                location.href = "notice_board.jsp";
            } else alert("게시글 작성에 실패하였습니다.")
        }
    };

    const today = new Date();
    const dd = today.getDate().toString();
    const mm = (today.getMonth() + 1).toString(); //January is 0!
    const yyyy = today.getFullYear().toString();
    req.open("post", "http://localhost:1234/board_write.do"
        + "?title="
        + encodeURIComponent(document.getElementById("board_title").value)
        + "&stdNumber="
        + encodeURIComponent(document.getElementById("board_stdNumber").value)
        + "&name="
        + encodeURIComponent(document.getElementById("board_name").value)
        + "&contents="
        + encodeURIComponent(document.getElementById("board_contents").value)
        + "&date="
        + yyyy + "-" + mm + "-" + dd
        , true);
    req.send(null);
}


