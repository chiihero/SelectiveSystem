$(document).ready(function () {
    var login = $('#loginform');
    var register = $('#registerform');
    var loc = window.location + '';
    var ee = loc.split('#');

    if (ee[1] = 'registerform' && ee[1] != undefined) {
        $('#loginbox').css({'height': '360px'});
        login.css({'z-index': '100', 'opacity': '0'});
        register.css({'z-index': '200', 'opacity': '1', 'display': 'block'});
    }

    $('.to-register').click(function () {
        switch_container(register, login, 350);
    });
    $('.to-login').click(function () {
        switch_container(login, register, 270);
    });

});

$('#sub_login').click(function () {
    var username = document.getElementById("username");
    var password = document.getElementById("password");
    if (username.value === "") {
        alert("账号不能为空!!");//账号不能为空
        return false;
    }
    if (password.value === "") {
        alert("密码不能为空!");
        return false;
    }
    var pattern = /^[\w_-]{8,24}$/;
    if (!pattern.test(password.value)) {
        alert("密码格式不正确!");
        return false;
    }
    console.time("测试加密速度: ");
    password.value = encrypt(password);
    console.timeEnd("测试加密速度: ");
    console.log(password.value)
});

$('#sub_register').click(function () {
    var username = document.getElementById("rusername");
    var usernamecard = document.getElementById("rusernamecard");
    var password = document.getElementById("rpassword");
    var relpassword = document.getElementById("rrelpassword");

    if (username.value === "") {
        alert("账号不能为空!!");//账号不能为空
        return false;
    }
    var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
    if (reg.test(usernamecard) === false) {
        alert("身份证输入不合法");
        return false;
    }
    if (password.value === "") {
        alert("密码不能为空!!");
        return false;
    }
    var pattern = /^[\w_-]{8,24}$/;
    if (!pattern.test(password.value)) {
        alert("密码格式不正确!");
        return false;
    }
    if (relpassword.value === "") {
        alert("确认密码不能为空!!");
        return false;
    }
    if (relpassword.value !== password.value) {
        alert("两次密码不一致!");
        return false;
    }
    console.time("测试加密速度: ");
    password.value = encrypt(password);
    console.timeEnd("测试加密速度: ");
    console.log(password.value)
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

function switch_container(to_show, to_husernamee, cwusernameth) {
    to_husernamee.css('z-index', '100').fadeTo(300, 0.01, function () {
        $('#loginbox').animate({'height': cwusernameth + 'px'}, 300, function () {
            to_show.fadeTo(300, 1).css('z-index', '200');
        });
    });
}

// var param = {
//     N: 8,   // 时空成本
//     r: 8,       // 块大小
//     P: 4        // 并发维度
// };
// var opt = {
//     maxPassLen: 32, // 缓冲区大小分配
//     maxSaltLen: 32,
//     maxDkLen: 32,
//     maxThread: 2    // 最多使用的线程数
// };
// scrypt.onload = function() {
//     console.log('scrypt loaded');
//     try {
//         scrypt.config(param, opt);
//     } catch (err) {
//         alert('config err: ' + err.message);
//     }
// };
// function init(){
//     scrypt.setResPath('./asset');
//     var mods = scrypt.getAvailableMod();
//     if (mods.length === 0) {
//         alert('浏览器必须支持 asm.js 或者 Flash Player 18+');
//         return;
//     }
//     scrypt.load();
//
// }

// function encrypt(str) {
//     var encrypt_str = scrypt.strToBin(str.value);
//     console.log('encrypt_str: ' + encrypt_str);
//
//     try {
//         scrypt.hash(encrypt_str, "", 32);
//     } catch (err) {
//         alert('hash err: ' + err.message);
//     }
// }
// scrypt.oncomplete = function(dk) {
//     console.log('dk: ' + scrypt.binToHex(dk));
//     var pwd = document.getElementById("password");
//     pwd.value =  scrypt.binToHex(dk)
// };
// function sleep(numberMillis) {
//     //记录当前时间
//     var now = new Date();
//     //设置未来的某个时间
//     var exitTime = now.getTime() + numberMillis;
//     while (true) {
//         //获取当前时间
//         now = new Date();
//         //检查是否到了设置好的未来时间
//         if (now.getTime() > exitTime)
//             return;
//     }
// }
// $(init)

