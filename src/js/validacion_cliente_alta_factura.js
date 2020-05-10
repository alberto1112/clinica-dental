var imported = document.createElement('script');
imported.src = '../../js/dates.js';
document.head.appendChild(imported);

function dateValidation(fechaCobro, fechaVencimiento, fechaFactura) {

    fechaCobro = new Date(fechaCobro);
    fechaVencimiento = new Date(fechaVencimiento);
    fechaFactura = new Date(fechaFactura);
    console.log(dates.compare(fechaCobro,fechaFactura));
    if (dates.compare(fechaCobro,fechaFactura)==-1 || dates.compare(fechaVencimiento,fechaFactura)==-1) {
        console.error("Error con la fecha de factura");
        var error = "Error con la fecha de factura"
    } else {
        var error = "";
    }
    return error;
}

function priceValidation(price) {
    var valid = true;

    valid = valid && price>0;

    if (!valid) {
        console.error("El precio no puede ser negativo");
        var error = "El precio debe ser > 0";
    } else {
        var error = ""
    }
    return error;
}
