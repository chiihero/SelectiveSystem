$(document).ready(function () {
    var login = $('#loginform');
    var register = $('#registerform');
    var loc = window.location + '';
    var ee = loc.split('#');

    if (ee[1] = 'registerform' && ee[1] != undefined) {
        $('#loginbox').css({ 'height': '350px' });
        login.css({ 'z-index': '100', 'opacity': '0' });
        register.css({ 'z-index': '200', 'opacity': '1', 'display': 'block' });
    }

    $('.to-register').click(function () {
        switch_container(register, login, 350);
    });
    $('.to-login').click(function () {
        switch_container(login, register, 270);
    });
});

$('#sub_login').click(function () {
    var username = $("#username");
    var password = $("#password");

    if (check_username(username.val())) {
        return false;
    }
    if (check_password(password.val())) {
        return false;
    }
    var pattern = /^[\w_-]{8,24}$/;
    if (!pattern.test(password.val())) {
        alert("密码格式不正确!");
        return false;
    }
    console.time("测试加密速度: ");
    password.val(encrypt(password.val()));
    console.timeEnd("测试加密速度: ");
    console.log(password.val());
});

// $('#sub_register').click(function () {
//     var username = $("#rusername");
//
//     var password = $("#rpassword");
//     var relpassword = $("#relpassword");
//
//     if (username.val() === "") {
//         alert("账号不能为空!!");//账号不能为空
//         return false;
//     }
//     if (password.val() === "") {
//         alert("密码不能为空!!");
//         return false;
//     }
//     var pattern = /^[\w_-]{8,24}$/;
//     if (!pattern.test(password.val())) {
//         alert("密码格式不正确!");
//         return false;
//     }
//     if (relpassword.val() === "") {
//         alert("确认密码不能为空!!");
//         return false;
//     }
//     if (relpassword.val() !== password.val()) {
//         alert("两次密码不一致!");
//         return false;
//     }
//     console.time("测试加密速度: ");
//     $("#rpassword").val(encrypt(password.val()));
//     console.timeEnd("测试加密速度: ");
// });

function switch_container(to_show, to_hide, cwidth) {
    to_hide.css('z-index', '100').fadeTo(300, 0.01, function () {
        $('#loginbox').animate({ 'height': cwidth + 'px' }, 300, function () {
            to_show.fadeTo(300, 1).css('z-index', '200');
        });
    });
}
