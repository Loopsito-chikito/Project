 
 function ValidationEvent() {
    // Storing Field Values In Variables
    var user = document.getElementById("usuario").value;
    var date = document.getElementById("date").value;
	var documento =document.getElementById("ndocumento").value;
        
    if (user != '') {
          
        if ( date != '' ) {   
			
			if (documento !=''){
			alert("Usuario Logeado.....!");
			return true;
			}
			else{
				alert ("Ingrese un Documento valido.....!");
			return false;
			}
        } else{
			alert ("Ingrese una fecha valida.....!");
			return false;
		      }
	}
	else {
        alert("Coloque Un Nombre de Usuario.....!");
        return false;
        }

        
    
    }