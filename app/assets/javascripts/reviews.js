$( document ).ready(function() {
  $('.button_like').click( function (){
    id = $(this).attr('id');
	$.get( "/review/"+$(this).attr('id')+'.json', function( data ) {
		$('#status'+id).html(data.status);
  	});
  });

});