const mattePrice = new Map([["10Х15", 15],
    ["15Х21", 28],
    ["21Х30", 62],
    ["30Х42", 170]]
);
const glossyPrice = new Map([["10Х15", 7.9],
    ["15Х21", 25],
    ["21Х30", 60],
    ["30Х42", 160]]
);


function MessageBox() {
    return swal("Oops!", "Данная страница в разработке", "error");
}
function openDialog(error){
    debugger;
    if (error > 0) {
        $("#dialog").dialog("open");
    }

}
function OpenRegistration(errorReg){
    debugger;
    if (errorReg > 0) {
        $("#registration").dialog("open");
    }
}
function orderBox() {
    if (NowUser === ""){
        return swal("Oops!", "Для доступа к данной странице нужно авторизироваться", "error");
    }
    else {
        window.location.href="orderPrint";
    }
}

function showInfo(file) {
    var len = file.files.length;
    var text= "";
    for (let i = 0; i < len; i++) {
        text = text + ("Имя: " + file.files[i].name + "  Размер: " + file.files[i].size + " Байт " + '\n');
    }
    document.getElementById('you-file').innerHTML = text;
    let sizePhoto = document.getElementById('select').value;
    let typePhoto = document.getElementById('select2').value;
    if (len > 0) {
        var price = 0;
        if (typePhoto === 'Матовая') {
            price = mattePrice.get(sizePhoto)
        } else if (typePhoto === 'Глянцевая') {
            price = glossyPrice.get(sizePhoto)
        }
        document.getElementById('total').innerHTML = (price * len).toFixed(2) + " Руб.";
        document.getElementById('totalHidden').value = (price * len).toFixed(2) + " Руб.";

    }
}
function changeSize() {
    let len = document.getElementById('photo').files.length;
    let sizePhoto = document.getElementById('select').value;
    let typePhoto = document.getElementById('select2').value;
    if (len>0) {
        var price = 0;
        if (typePhoto === 'Матовая') {
            price = mattePrice.get(sizePhoto)
        } else if (typePhoto === 'Глянцевая') {
            price = glossyPrice.get(sizePhoto)
        }
        document.getElementById('total').innerHTML = (price * len).toFixed(2) + " Руб.";
        document.getElementById('totalHidden').value = (price * len).toFixed(2) + " Руб.";
    }
}
