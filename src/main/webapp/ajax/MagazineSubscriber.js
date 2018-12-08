function trimById(elementId) {
    document.getElementById(elementId).value = document.getElementById(elementId).value.trim();
    return document.getElementById(elementId)
}

function magazineLoadSubscribe() {
    let req = new XMLHttpRequest();
    req.onreadystatechange = function () {
        if (req.readyState === 4 && req.status === 200) {
            const resultText = this.responseText.substring(1, this.responseText.length - 1);
            const json = JSON.parse(resultText);
            const table = document.getElementById("magazineTable");
            table.innerHTML = "";

            for (let i = 0; i < json.length; i++) {
                let row = table.insertRow(0);
                let magazineNumber = row.insertCell(0);
                magazineNumber.innerHTML = json[i].magazineNumber;
                magazineNumber.style.width = '45px';
                magazineNumber.style.textAlign = 'center';

                let name = row.insertCell(1);
                name.innerHTML = json[i].name;
                name.style.width = '67px';
                name.style.textAlign = 'center';

                let title = row.insertCell(2);
                title.innerHTML = json[i].title;
                title.style.width = 'auto';
                title.style.textAlign = 'center';

                let contents = row.insertCell(3);
                contents.innerHTML = json[i].contents;
                contents.style.width = 'auto';
                contents.style.textAlign = 'center';

                let date = row.insertCell(4);
                date.innerHTML = json[i].date;
                date.style.width = '77px';
                date.style.textAlign = 'center';
            }
        }
    };

    setInterval(function () {
        req.open("post", "http://localhost:1234/magazine_load.do", true);
        req.send(null);
    }, 100);
}


function magazineWriteSubscribe() {
    let magazine_title = trimById("magazine_title");
    let magazine_contents = trimById("magazine_contents");

    if (magazine_title.value !== "" && magazine_contents.value !== "") {
        let req = new XMLHttpRequest();
        req.onreadystatechange = function () {
            if (req.readyState === 4 && req.status === 200) {
                const json = JSON.parse(this.responseText);
                if (json[0] === true) {
                    alert("매거진이 등록되었습니다.");
                    location.href = "magazine_board.jsp";
                } else alert("매거진 작성에 실패하였습니다.")
            }
        };

        const today = new Date();
        const dd = today.getDate().toString();
        const mm = (today.getMonth() + 1).toString(); //January is 0!
        const yyyy = today.getFullYear().toString();
        req.open("post", "http://localhost:1234/magazine_write.do"
            + "?stdNumber="
            + encodeURIComponent(document.getElementById("magazine_stdNumber").value)
            + "&name="
            + encodeURIComponent(document.getElementById("magazine_name").value)
            + "&title="
            + encodeURIComponent(document.getElementById("magazine_title").value)
            + "&contents="
            + encodeURIComponent(document.getElementById("magazine_contents").value)
            + "&date="
            + yyyy + "/" + mm + "/" + dd
            , true);
        req.send(null);
    } else{
        alert("모든 항목을 입력해주세요")
    }
}