$('#submit').click(function () {
    var old_pwd = $("#old_password");
    var new_pwd = $("#new_password");
    var new_agn_pwd = $("#new_password_again");
    if (check_password(old_pwd.val())) return false;
    if (check_password(new_pwd.val()))return false;
    if (check_newpassword(new_agn_pwd.val()))return false;
    if (check_passwordtwo(new_pwd,new_agn_pwd))return false;

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
