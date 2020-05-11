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

function valueValidation(value) {
    var valid = true;

    valid = valid && value>0;

    if (!valid) {
        console.error("El precio no puede ser negativo");
        var error = "El valor debe ser > 0";
    } else {
        var error = ""
    }
    return error;
}
