function ValidationEvent() {
    // Storing Field Values In Variables
    var user = document.getElementById("usuario").value;
    var pass = document.getElementById("password").value;

        
    if (user != '') {
          
        if ( pass != '' ) {   
			
	
			alert("Usuario Logeado.....!");
			return true;
        } else{
			alert ("Ingrese un password !");
			return false;
		      }
	}
	else {
        alert("Coloque Un Nombre de Usuario.....!");
        return false;
        }

        
    
    }
