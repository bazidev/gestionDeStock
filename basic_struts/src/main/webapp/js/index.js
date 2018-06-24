$(document).ready(function() {
	$('.selectpicker').selectpicker({
	    format: 'dd/MM/yyyy',
		size : 8
	});
	
	// remove duplicate choices
	$('.bootstrap-select').on('click',function(){
		seen = {};	
		$('ul.dropdown-menu  li a span.text').each(function() {
			var txt = $(this).text();
			if (seen[txt])
				{
				console.log('seen');
				$(this).remove();
				}
			else
				seen[txt] = true;
		});

	});
	
	//pass row values to edit inventaire modal
	
	$(document).on("click", ".editInv", function () {
	     var code = $(this).parent().parent().find("th").html();
	     var codeArt = $(this).parent().parent().find("#codeArt").html();
	     var qteArt = $(this).parent().parent().find("#qteArt").html();
	     var descInv = $(this).parent().parent().find("#descInv").html();
	     var dateInv = $(this).parent().parent().find("#dateInv").html();
	     
	     $("#editModal #inv-id").val( code );
	     $("#editModal #quantite").val( qteArt	 );
	     $("#editModal #description").val( descInv );
	      $('#articlePicker').val(codeArt);
	     $('#articlePicker').change();
	     
	     //set date value
	     var date = new Date(dateInv);
	     var day = ("0" + date.getDate()).slice(-2);
	     var month = ("0" + (date.getMonth() + 1)).slice(-2);

	     var today = date.getFullYear()+"-"+(month)+"-"+(day) ;
	     $("#editModal #date").val(today);

	     console.log(dateInv);

	     console.log(date);
	     console.log(today)
	     
	});
	
	// modal de confirmation de supprission d'inventaire
	$(document).on("click", ".conf-sup", function () {
	     var code = $(this).parent().parent().find("th").html();
	   
	     $("#confirmModal #inv-id").val( code );
	    
	});
	
	
	
	//pass row values to edit achat modal
	
	$(document).on("click", ".editAchat", function () {
	     var code = $(this).parent().parent().find("th").html();
	     var codeArt = $(this).parent().parent().find("#codeArt").html();
	     var qteArt = $(this).parent().parent().find("#qte").html();
	     var dateInv = $(this).parent().parent().find("#date").html();
	     
	     $("#editAchatModal #achat-id").val( code );
	     $("#editAchatModal #quantite").val( qteArt	 );
	      $('#articlePicker').val(codeArt);
	     $('#articlePicker').change();
	     
	     //set date value
	     var date = new Date(dateInv);
	     var day = ("0" + date.getDate()).slice(-2);
	     var month = ("0" + (date.getMonth() + 1)).slice(-2);

	     var today = date.getFullYear()+"-"+(month)+"-"+(day) ;
	     $("#editAchatModal #date").val(today);
	     
	     console.log(code);
	     console.log(dateInv);

	     console.log(date);
	     console.log(today)
	     
	});
	
	// modal de confirmation de supprission d'achat
	$(document).on("click", ".conf-sup-achat", function () {
	     var code = $(this).parent().parent().find("th").html();
	   
	     $("#confirmAchatModal #achat-id").val( code );
	    
	});
	
	
});

function toDate(dateStr) {
	  var parts = dateStr.split(" ");
	  var date = parts[0];
	  console.log("date : "+date);
	  var dateparts = date.split("/");
	  return new Date("20"+dateparts[2],dateparts[0], dateparts[1])
}