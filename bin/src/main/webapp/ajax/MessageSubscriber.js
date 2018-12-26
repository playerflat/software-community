let globalGroupName;
let globalInterval;

function messageLoadSubscribe(groupName) {
    let req = new XMLHttpRequest();
    clearInterval(globalInterval);

    globalInterval = setInterval(function () {
        req.open("post", "http://localhost:1234/message_load.do/" + groupName, true);
        req.send(null);
        req.onreadystatechange = function () {
            if (req.readyState === 4 && req.status === 200) {
                const stdName = document.getElementById("sent_name").value;
                const resultText = this.responseText.substring(1, this.responseText.length - 1);
                const json = JSON.parse(resultText);
                globalGroupName = groupName;

                $('#chatList').empty();
                for (var i = 0; i < json.length; i++) {
                    addreceivedChat(json[i].name, json[i].contents, json[i].time, stdName)
                }
            }
        };
    }, 100);

    globalInterval();
}

function addreceivedChat(name, contents, time, myName) {
    if (name != myName) {
        $('#chatList').append('<div class="incoming_msg">' +
            '<div class="received_msg">' +
            '<div class="received_withd_msg">' +
            '<h7>' + name + '</h7>' +
            '<p>' + contents + '</p>' +
            '<span class="time_date">' + time + '</span></div>' +
            '</div>' +
            '</div>')
    } else {
        $('#chatList').append('<div class="outgoing_msg">' +
            '<div class="sent_msg">' +
            '<h7>' + name + '</h7>' +
            '<p>' + contents + '</p>' +
            '<span class="time_date"></span></div>' +
            '</div>')
    }
}

// <%--<div class="outgoing_msg">--%>
//     <%--<div class="sent_msg">--%>
//         <%--<h7>강민구</h7>--%>
//         <%--<p>Test which is a new approach to have all--%>
//             <%--solutions</p>--%>
//         <%--<span class="time_date"></span></div>--%>
//     <%--</div>--%>

function messageWriteSubscribe() {
    let req = new XMLHttpRequest();
    req.onreadystatechange = function () {
        if (req.readyState === 4 && req.status === 200) {
            const json = JSON.parse(this.responseText);
            if (json[0] === true) {
                $('#sent_contents').val('');
            }
        }
    };

    const today = new Date();
    const HH = today.getHours().toString();
    const mm = today.getMinutes().toString();
    // const ss = today.getMilliseconds().toString();

    req.open("post", "http://localhost:1234/message_write.do"
        + "?groupName="
        + globalGroupName
        + "&name="
        + encodeURIComponent(document.getElementById("sent_name").value)
        + "&contents="
        + encodeURIComponent(document.getElementById("sent_contents").value)
        + "&time="
        + HH + ":" + mm
        , true);
    req.send(null);
}

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