function check_studentdata() {
    var no = document.getElementById("no").value;
    var name = document.getElementById("name").value;
    var sex = document.getElementById("sex").value;
    var age = document.getElementById("age").value;
    var sdept = document.getElementById("sdept").value;
    var success = 0;

    if (no === "") {
        document.getElementById("no_text").innerText = "学号不能为空";
    }
    else {
        success++;
    }
    if (name === "") {
        document.getElementById("name_text").innerText = "姓名不能为空";
    }
    else {
        success++;
    }
    if (sex === "") {
        document.getElementById("sex_text").innerText = "性别不能为空";
    }
    else {
        success++;
    }
    if (age === "") {
        document.getElementById("age_text").innerText = "年龄不能为空";

    }
    else {
        success++;

    }
    if (sdept === "") {
        document.getElementById("sdept_text").innerText = "系别不能为空";
    }
    else {
        success++;
    }
    if (success > 5) {
        document.getElementById("useradd").submit();
    }
}