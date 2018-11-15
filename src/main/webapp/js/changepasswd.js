$('#submit').click(function () {
    var old_pwd = document.getElementById("old_password");
    var new_pwd = document.getElementById("new_password");
    var new_agn_pwd = document.getElementById("new_password_again");
    if (old_pwd.value === "") {
        alert("旧密码不能为空!!");
        return false;
    }
    if (new_pwd.value === "") {
        alert("新密码不能为空!!");
        return false;
    }
    if (new_agn_pwd.value === "") {
        alert("确认密码不能为空!");
        return false;
    }
    if (new_agn_pwd.value !== new_pwd.value) {
        alert("确认密码不一致!");
        return false;
    }
    if (old_pwd.value === new_pwd.value) {
        alert("新密码不能与旧密码相同!");
        return false;
    }
    var pattern = /^[\w_-]{8,24}$/;
    if (!pattern.test(old_pwd.value) || !pattern.test(new_pwd.value) || !pattern.test(new_agn_pwd.value)) {
        alert("密码格式不正确!");
        return false;
    }
    new_pwd.value = encrypt(new_pwd);
    old_pwd.value = encrypt(old_pwd);
});

function encrypt(str) {
    var encrypt_str = str.value;
    for (var i = 0; i < 4096; i++) {
        var shaObj = new jsSHA("SHA-512", "TEXT");
        shaObj.update(encrypt_str);
        encrypt_str = shaObj.getHash("HEX");
        // console.log(encrypt_str)
    }
    return hex_md5(encrypt_str);
}