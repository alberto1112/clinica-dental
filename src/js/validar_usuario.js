function validateForm(){
    var novalidation = document.getElementById("#altaUsuario").novalidate;
    if(!novalidation){
        var error1 = passwordValidation();
        var error2 = passwordConfirmation();

        return (error1.length==0)&&(error2.length==0);
    }else{
        return true;
    }
}

function passwordValidation(){
    var password = document.getElementById("pass");
    var value = password.value;
    var isValid = true;

    isValid = isValid && (value.length>=8);

    var hasNumber = /\d/;
    var hasUpperKey = /[A-Z]/;
    var hasLowKey = /[a-z]/;
    isValid = isValid && (hasNumber.test(value)) && (hasUpperKey.test(value)) && (hasLowKey.test(value));
    if(!isValid){
        var error = "Please enter a valid password! Length >= 8, (upper and lower case) letters and digits";
    }else{
        var error = "";
    }
        value.setCustomValidity(error);
    return error;
}

function passwordConfirmation(){
    var password = document.getElementById("pass");
    var pValue = password.value;
    var Cpassword = document.getElementById("passConf");
    var confirm = Cpassword.value;
    if (pValue != confirm) {
        var error = "Please enter matching passwords!";
    }else{
        var error = "";
    }

    Cpassword.setCustomValidity(error);

    return error;

}

function passwordStrength(password){
    var letters = {};

    var length = password.length;
    for(x = 0, length; x < length; x++) {
        var l = password.charAt(x);
        letters[l] = (isNaN(letters[l])? 1 : letters[l] + 1);
    }
    return Object.keys(letters).length / length;
}

function passwordColor(){
    var passField = document.getElementById("pass");
    var strength = passwordStrength(passField.value);
    
    if(!isNaN(strength)){
        var type = "weakpass";
        if(passwordValidation()!=""){
            type = "weakpass";
        }else if(strength > 0.7){
            type = "strongpass";
        }else if(strength > 0.4){
            type = "middlepass";
        }
    }else{
        type = "nanpass";
    }
    passField.className = type;
    
    return type;
}
