function ValidationEvent() {
    // Storing Field Values In Variables
    var produc = document.getElementById("producto").value;
    var date = document.getElementById("date").value;
	var datev = document.getElementById("datev").value;
	var codi =document.getElementById("codigo").value;
        
    if (produc != '') {
          
        if ( date != '' ) {   
			
			if (datev !=''){
				if (codi!=''){
					alert("Usuario Logeado.....!");
					return true;
				}else{
					alert ("Ingrese un Codigo valido.....!");
					return false;
					}
				
			
			}else{
				alert ("Ingrese un Fecha Valida.....!");
				return false;
			}
        } else{
			alert ("Ingrese una fecha valida.....!");
			return false;
		      }
	}else{ 
		alert ("Ingrese una Nombre Para El Producto.....!");
		document.getElementById("datev").value;

			return false;
	}
}