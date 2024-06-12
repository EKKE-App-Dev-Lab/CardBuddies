var form = document.getElementById('contactForm');
var customerName = document.getElementById('customerName');
var email = document.getElementById('customerEmail');
var phone = document.getElementById('customerPhone');
var orderNumber = document.getElementById('orderNumber');
var message = document.getElementById('customerNote');
var buttonPressed = document.getElementById('submit');

if(buttonPressed.id == 'submit')
{
	form.addEventListener( 'submit', (e) => {
		var nameError = "";
		var emailError = "";
		var phoneError = "";
	
		document.getElementById("nameError").innerHTML = "";
		document.getElementById("emailError").innerHTML = "";
		document.getElementById("phoneError").innerHTML = "";
	
		var allErrors = [];
	
		customerName.value = String(customerName.value).trim();
		var regName = /^[a-zA-ZÁÉÍÓÖŐÚÜŰáéíóöőúüű-' ]*$/
		   if( !customerName.value.match(regName) )
		{
			nameError = "Csak betűk és szóközök engedélyezettek";
			document.getElementById( "nameError" ).innerHTML = nameError;
			allErrors.push( nameError );
		}
		
		email.value = String(email.value).trim();
		var regEmail = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
		if( !email.value.match(regEmail) )
		{
			emailError = "Nem megfelelő email formátum";
			document.getElementById( "emailError" ).innerHTML = emailError;
			allErrors.push( emailError );
		}
	
		if (phone.value != '' && phone.value != null) 
		{
			phone.value = String(phone.value).trim();
			var regPhone = /^(\d{7}|\d{8}|(\d{3}[- ]\d{4}|\d{4}[- ]\d{3}|\d{4}[- ]\d{2}[- ]\d{2}))$/;
			if (!phone.value.match(regPhone)) {
				phoneError = "Adjon meg egy érvényes telefonszámot";
				document.getElementById("phoneError").innerHTML = phoneError;
				allErrors.push(phoneError);
			}
		}
	
		if(allErrors.length > 0)
		{
			e.preventDefault();
			document.getElementById( "sendError" ).innerHTML = "Az üzenet elküldése sikertelen!";
		}
		else
		{
			sendMessage();
			document.getElementById( "sendError" ).innerHTML = "Üzenet elküldve!";
			e.preventDefault();
		}
	})
	
	function sendMessage() {
		var var_str = "customerName=" + customerName.value + "&customerEmail=" + email.value + "&customerMessage=" + message.value;
	
		if( !phone.value.length == 0)
		{
			var_str += "&customerPhone=" + phone.value;
		}
	
		if(!orderNumber.value.length == 0)
		{
			var_str += "&orderNumber=" + message.orderNumber;
		}
	
		const xhr = new XMLHttpRequest();
	
		xhr.onreadystatechange = function(){
		if (this.readyState == 4 && this.status == 200) {
				document.getElementById("sendError").innerHTML = this.responseText;
			}
		};
	
		xhr.open("POST", "validateContactInput.php", true);
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send(var_str);
	}
}
