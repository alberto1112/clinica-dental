var imported = document.createElement('script');
imported.src = '../../js/dates.js';
document.head.appendChild(imported);

function dateValidation(entrada,entrega) {

    var dateEntrada = new Date(entrada);
    var dateEntrega = new Date(entrega);
    
    
    if(!dateEntrada){
        dateEntrada = new Date();
    }
    
    if(dates.compare(dateEntrada,dateEntrega) == -1){

        var error = "<br>&emsp;La fecha de entrada debe ser antes que la fecha de entrega";
        console.error("La fecha de entrada debe ser antes que la fecha de entrega");
        
    }else{
        var error = ""
    }

    return error;
}
