function groupLoadSubscribe() {
    let req = new XMLHttpRequest();
    req.onreadystatechange = function () {
        if (req.readyState === 4 && req.status === 200) {
            const resultText = this.responseText.substring(1, this.responseText.length - 1);
            const json = JSON.parse(resultText);

            for (let i = 0; i < json.length; i++) {
                $('#groupList')
                    .append(
                        '<div class="room_' + i + ' " style="text-align: center">'
                        + '<br>'
                        + '<h4>'
                        + json[i].name
                        + '</h4>'
                        + '</div>'
                    );
                $('.room_' + i)
                    .click(function () {
                        messageLoadSubscribe(json[i].name);
                    });
            }
        }
    };
    req.open("post", "http://localhost:1234/group_load.do", true);
    req.send(null);
}