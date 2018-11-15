function submitlogin() {
    var userno = document.getElementById("userno");
    var idcard = document.getElementById("idcard");

    var password = document.getElementById("password");
    var relpassword = document.getElementById("relpassword");

    // var rand = document.getElementById("rand");

    if (userno.value == "") {
        alert("\u7528\u6237\u540d\u4e0d\u80fd\u4e3a\u7a7a\uff01");
        return false;
    }
    if (password.value == "") {
        alert("\u5bc6\u7801\u4e0d\u80fd\u4e3a\u7a7a!");
        return false;
    }
    if (relpassword.value == "") {
        alert("\u5bc6\u7801\u4e0d\u80fd\u4e3a\u7a7a!");
        return false;
    }
    if (relpassword.value !== password.value) {
        alert("两次密码不一致!");
        return false;
    }

    // if (rand.value == "") {
    //     alert("\u9a8c\u8bc1\u7801\u4e0d\u80fd\u4e3a\u7a7a");
    //     return false;
    // }


    password.value = BASE64.encoder(password.value);
    document.getElementById("login").submit();
}

function changepw() {
    var usernoName1 = document.getElementById("usernoName1");
    var password1 = document.getElementById("password1");
    var password2 = document.getElementById("password2");
    var password3 = document.getElementById("password3");
    if (usernoName1.value == "") {
        alert("\u7528\u6237\u540d\u4e0d\u80fd\u4e3a\u7a7a\uff01");
        return false;
    }
    if (password1.value == "") {
        alert("\u65e7\u5bc6\u7801\u4e0d\u80fd\u4e3a\u7a7a!");
        return false;
    }
    if (password2.value == "") {
        alert("\u65b0\u5bc6\u7801\u4e0d\u80fd\u4e3a\u7a7a!");
        return false;
    }
    if (password3.value != password2.value || password3.value == "") {
        alert("\u65b0\u5bc6\u7801\u524d\u540e\u4e0d\u4e00\u81f4!");
        return false;
    }
    document.getElementById("pwchange").submit();
}

function showRand() {
    var time = new Date().getTime();
    document.getElementById("random").src = "/common/image.jsp?time=" + time;
}

function getPassword() {
    var usernoName = document.getElementById("usernoName2");
    if (usernoName.value == "") {
        JSMessage.getMessage("16001001", function (data) {
            alert(data);
        });
    } else {
        Password.getPassword(usernoName.value, function (data) {
            alert(data);
        });
    }
}


