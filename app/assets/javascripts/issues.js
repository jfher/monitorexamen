$( document ).ready(function() {
  $('.button_cancelar').click( function (){

  	id = $(this).attr('id');
	$.get( "/issues/cancel/"+$(this).attr('id')+'.json', function( data ) {
		$('#status'+id).html(data.status);
  	});
  });

});