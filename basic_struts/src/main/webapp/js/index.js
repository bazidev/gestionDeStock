$(document).ready(function() {
	$('.selectpicker').selectpicker({

		size : 4
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
});