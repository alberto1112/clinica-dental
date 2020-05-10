function lettersValidation(name) {
    var valid = true;

    var hasLetters = /^[a-zA-Z ]*$/;

    valid = valid && hasLetters.test(name);

    if (!valid) {
        console.error("Nombre no válido");
        var error = "Solo puedes introducir espacios y letras"
    } else {
        var error = "";
    }

    return error;
}

function numberValidation(number) {
    var valid = true;

    valid = valid && number.length==9;

    var hasNumber = /^[0-9]{9}/;

    valid = valid && hasNumber.test(number);

    if (!valid) {
        console.error("Número no válido");
        var error = "Escribe un número adecuado"
    } else {
        var error = "";
    }

    return error;
}

function nColValidation(number) {
    var valid = true;

    valid = valid && number.length==4;

    var hasNumber = /^[0-9]{4}/;

    valid = valid && hasNumber.test(number);

    if (!valid) {
        console.error("Número no válido");
        var error = "Escribe un número adecuado"
    } else {
        var error = "";
    }

    return error;
}
