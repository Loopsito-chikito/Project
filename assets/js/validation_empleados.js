function validacion_empleados(){
	var user=document.getElementById("usuarios").value;
	var date=document.getElementById("date").value;
	var doc=document.getElementById("typeDocument").value;
	var ndoc=document.getElementById("ndocumento").value;
	var email=document.getElementById("email").value;

	
if (user=="") {
	alert("POR FAVOR DIGITE EL USUARIO");
	return false;
}
if (date==""){
	alert("POR FAVOR DIGITE LA FECHA");
	return false;
}
if (doc==""){
	alert("POR FAVOR SELECCIONE EL TIPO DE DOCUMENTO");
	return false;
}
if (ndoc==""){
	alert("POR FAVOR DIGITE EL DOCUMENTOD");
	return false;
}
if (email==""){
	alert("POR FAVOR DIGITE EL EMAIL");
	return false;
}
}