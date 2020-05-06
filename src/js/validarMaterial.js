function validateMaterial(){
    var novalidation = document.getElementById("#nuevo-material").novalidate;
    if(!novalidation){
        var error1 = consultaStock();

        return (error1.length==0);
    }else{
        return true;
    }
}

function consultaStock(){
    var stock = document.getElementById("stock").value;
    var min = document.getElementById("stockMin").value;
    var crit = document.getElementById("stockCrit").value;
    var correctvalues = true;

    correctvalues = correctvalues && (crit<min) && (min<stock);
    if(!correctvalues){
        var error = "Please, select correct values! Initial stock can not be less than minimal or critical required";
    }else{
        var error = "";
    }
    stock.setCustomValidity(error);
    return error;
}
