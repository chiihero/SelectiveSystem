﻿function changepassword() {
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
//根据value选择选择框选项
function select_true(value) {
    $("select option[value='" + value + "']").attr("selected", true);
}

function check_studentdata() {
    var no = $('#sno');
    var name = $('#sname');
    var age = $('#sage');
    var pass = $('#password');

    if (check_username(no.val()))
        return false;
    if (check_name(name.val()))
        return false;
    if (check_age(age.val()))
        return false;
    if (!check_password(pass.val())){
        pass.val(encrypt(pass.val()));
    }
}
function check_teacherdata() {
    var no = $('#tno');
    var name = $('#tname');
    var age = $('#tage');
    var cno1 = $('#cno1');
    var cno2 = $('#cno2');
    var cno3 = $('#cno3');
    var pass = $('#password');

    if (check_username(no.val()))
        return false;

    if (check_name(name.val()))
        return false;
    if ((parseInt(age.val()) < 24 || parseInt(age.val()) > 60) || (age.val() === "")) {
        alert("年龄必须在24岁到60岁之间");
        return false;
    }
    if ((cno1.val()!==0) || (cno2.val()!==0)){
         if (cno1.val() === cno2.val()) {
             alert("1和2课程冲突");
             return false;
         }
    }
    if ((cno1.val()!==0) || (cno3.val()!==0)){
        if (cno1.val() === cno3.val()) {
            alert("1和3课程冲突");
            return false;
        }
    }
    if ((cno2.val()!==0) || (cno3.val()!==0)){
        if (cno2.val() === cno3.val()) {
            alert("2和3课程冲突");
            return false;
        }
    }
    if (!check_password(pass.val())){
        pass.val(encrypt(pass.val()));
    }
}
$(document).ready(function () {
    $('#teacherChange').click(function () {

    })
});
function check_age(age) {
    if (age === "") {
        // document.getElementById("age_text").innerText = "年龄不能为空";
        alert("年龄不能为空!!");//年龄不能为空
        return true;
    }
    return false;
}
function check_name(name) {
    if (name === "") {
        // document.getElementById("name_text").innerText = "姓名不能为空";
        alert("姓名不能为空!!");

        return true;
    }
    return false;
}
function check_id(id) {
    if (id === "") {
        // document.getElementById("no_text").innerText = "ID不能为空";
        alert("ID不能为空!!");

        return true;
    }
    return false;
}
function check_username(username) {
    if (username === "") {
        alert("用户号不能为空!!");//账号不能为空
        return true;
    }
    return false;
}
function check_password(password) {
    var pattern = /^[\w_-]{8,24}$/;
    if ((password === "")||(!pattern.test(password))) {
        alert("密码格式不正确!");
        return true;
    }
    return false;
}
function check_newpassword(newpassword) {
    if (newpassword === "") {
        alert("确认密码不能为空!");
        return true;
    }
    return false;
}
function check_passwordtwo(newpassword,oldpassword) {
    if (newpassword !== oldpassword) {
        alert("确认密码不一致!");
        return true;
    }
    return false;
}
function encrypt(encrypt_str) {
    try{
        var shaObj = new jsSHA("SHA3-512", "TEXT",{numRounds: parseInt("4096", 10)});
        shaObj.update(encrypt_str);
        encrypt_str = shaObj.getHash("HEX");
        console.log(encrypt_str);
    }catch (e) {
        alert(e.message)
    }
    return hex_md5(encrypt_str);
}