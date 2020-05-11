var imported = document.createElement('script');
imported.src = '../../js/dates.js';
document.head.appendChild(imported);

function dateValidation(fechaSolicitud, fechaEntrega) {
    fechaSolicitud = new Date(fechaSolicitud);
    fechaEntrega = new Date(fechaEntrega);

    if (dates.compare(fechaSolicitud,fechaEntrega) == 1) {
        console.error("Error con la fecha");
        var error = "Error con la fecha";
    } else {
        var error = "";
    }
    return error;
}