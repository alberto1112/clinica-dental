function valueValidation(price) {
    var valid = true;

    valid = valid && price>0;

    if (!valid) {
        console.error("El precio no puede ser negativo");
        var error = "El valor debe ser > 0";
    } else {
        var error = ""
    }
    return error;
}