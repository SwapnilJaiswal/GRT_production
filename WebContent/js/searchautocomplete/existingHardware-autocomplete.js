$(function(){
  var pids = [
    "SF220-48P-K9-CN" ,
    "SF220-48P-K9-EN",
	"SF220-48P-K9-EU",
	"Raghu"
    
  ];
  
  // setup autocomplete function pulling from pids[] array
  $( '#hardwarepids' ).autocomplete({
    source: pids
  });
  
  /*$('input').autocomplete({
	    search: function(event, ui) {
	        $('.outputhardware ul').empty();
	    },
	    source: pids
	}).data('autocomplete')._renderItem = function(ul, item) {

	    return $('<li/>')
	   .data('item.outputhardware', item)
	   .append(item.value)
	   .appendTo($('.outputhardware ul'));
	};*/
  

});