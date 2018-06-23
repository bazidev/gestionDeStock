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
	
	//pass row values to edit modal
	
	$(document).on("click", ".editInv", function () {
	     var code = $(this).parent().parent().find("th").html();
	     var codeArt = $(this).parent().parent().find("#codeArt").html();
	     var qteArt = $(this).parent().parent().find("#qteArt").html();
	     var descInv = $(this).parent().parent().find("#descInv").html();
	     var dateInv = $(this).parent().parent().find("#dateInv").html();
	     console.log(code);
	     console.log(dateInv);
	     $("#editModal #inv-id").html( code );
	     $("#editModal #quantite").val( qteArt	 );
	     $("#editModal #description").val( descInv );
	    
	     $("#editModal #date").val( dateInv );
	     $('#articlePicker').val(codeArt);
	     $('#articlePicker').change();
	     // As pointed out in comments, 
	     // it is superfluous to have to manually call the modal.
	     // $('#addBookDialog').modal('show');
	});
	
});