$(document).ready(function() {
  var menuToggle = $('#js-mobile-menu').unbind();
  $('#js-navigation-menu').removeClass("show");

  menuToggle.on('click', function(e) {
    e.preventDefault();
    if ($('.navigation-menu').hasClass('reveal')) {
      $('.navigation-menu').slideUp().removeClass('reveal');
    } else {
      $('.navigation-menu').slideDown().addClass('reveal');
    }
  });
});
