function loginFunc(){
    document.getElementById("login-form").style.visibility = "visible";
    document.getElementById("signup-form").style.visibility = "hidden";
}

function signupFunc(){
    document.getElementById("signup-form").style.visibility = "visible";
    document.getElementById("login-form").style.visibility = "hidden";
}

function newPost(){
    document.getElementById("post").classList.toggle("postbox1");
    document.getElementById("blur").style.filter = "blur(1px)";
    document.getElementById("blur1").style.filter = "blur(1px)";
    document.getElementById("blur2").style.filter = "blur(1px)";
}

function deblur(){
    document.getElementById("blur").style.filter = "blur(0px)";
    document.getElementById("blur1").style.filter = "blur(0px)";
    document.getElementById("blur2").style.filter = "blur(0px)";
}