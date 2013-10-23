$(function() {
  return $('.item_name').autocomplete({
    minLength: 2,
    autoFocus: true,
    select: function( event, ui ) {
      // Verify the data source
      if (ui.item.kind == "srv") {
        $('#service_id').val(ui.item.id);
      }else{
        $('#supply_id').val(ui.item.id);
      };
    },
    source: function(request, response) {
      return $.ajax({
        url: $('.item_name').data('autocompleteurl'),
        data: {
          item: request.term
        },
        success: function(data) {
          return response(data);
        }
      });
    },
    open: function( event, ui ) {
      // Bold the term that matchs
      var term = $( this ).val();
      $( this ).autocomplete( "widget" ).find( ".ui-menu-item > a" )
          .html( function(i, oldHtml) {
              return oldHtml.replace( term, "<b>$&</b>" );
          }
      );
      var firstElement = $(this).data("uiAutocomplete").menu.element[0].children[0]
         , inpt = $('.item_name')
         , original = inpt.val()
         , firstElementText = $(firstElement).text();
      
      if(firstElementText.toLowerCase().indexOf(original.toLowerCase()) === 0){
          inpt.val(firstElementText);//change the input to the first match
          inpt[0].selectionStart = original.length; //highlight from end of input
          inpt[0].selectionEnd = firstElementText.length;//highlight to the end
      }
    },
    focus: function(event, ui) {
      $('#call_servant_id').val(ui.item.s_id);
      $('#call_dpto_id').val(ui.item.s_dpto_id);
    }
  }); 
});