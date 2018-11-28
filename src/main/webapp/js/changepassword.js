function changepassword() {
    var old_pwd = $("#password");
    var new_pwd = $("#newpassword");
    var new_agn_pwd = $("#new_password_again");
    if (check_password(old_pwd.val())) return false;
    if (check_password(new_pwd.val()))return false;
    if (check_newpassword(new_agn_pwd.val()))return false;
    if (check_passwordtwo(new_pwd.val(),new_agn_pwd.val()))return false;

    if (old_pwd.val() === new_pwd.val()) {
        alert("新密码不能与旧密码相同!");
        return false;
    }
    var pattern = /^[\w_-]{8,24}$/;
    if (!pattern.test(old_pwd.val()) || !pattern.test(new_pwd.val()) || !pattern.test(new_agn_pwd.val())) {
        alert("密码格式不正确!");
        return false;
    }
    new_pwd.val(encrypt(new_pwd.val()));
    old_pwd.val(encrypt(old_pwd.val()));
    new_agn_pwd.val(new_pwd.val());

}
