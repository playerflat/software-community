function groupLoadSubscriber() {
    let req = new XMLHttpRequest();
    req.onreadystatechange = function () {
        if (req.readyState === 4 && req.status === 200) {
            const resultText = this.responseText.substring(1, this.responseText.length - 1);
            const json = JSON.parse(resultText);

            for(var i = 0; i < json.length; i++ ){
                loadGroup(json[i].name);
            }
        }
    };
        req.open("post", "http://localhost:1234/group_load.do", true);
        req.send(null);
}

function loadGroup(grupName){
    $('#groupList').append('<div class="chat_list" style="cursor: pointer" onclick="messageLoadSubscriber()">' +
                            '<div className="chat_people">' +
                            '<div className="chat_ib">' +
                            '<h5>' +
                            grupName +
                            '<span className="chat_date"></span></h5>'+
                            '</div>' +
                            '</div>' +
                            '</div>')
}