$(document).on('turbolinks:load', function() {
  $('.accordion').each(function() { $(this).accordion() });


  if($('#pattern_confirmation').length) {
    $('#pattern_checkboxes input').change(function() {
      var pattern = $(this).val();
      if($(this).is(":checked")) {
        $('.pattern_text_'+pattern).slideDown();
      } else {
        $('.pattern_text_'+pattern).slideUp();
      }
    })
  }
})
