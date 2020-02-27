(function($) {

	'use strict';


  // aos
  AOS.init({
    duration: 1000
  });


  var dateAndTime = function() {
    $('#m_date').datepicker({
      'format': 'yyyy/mm/dd',
      'autoclose': true
    });
    $('#reCheckInDate, #reCheckOutDate').datepicker({
      'format': 'yyyy-MM-dd ',
      'autoclose': true
    });
    $('#m_time').timepicker();
  };
  dateAndTime();


  var goToTop = function() {

    $('.js-gotop').on('click', function(event){

      event.preventDefault();

      $('html, body').animate({
        scrollTop: $('html').offset().top
      }, 500, 'easeInOutExpo');

      return false;
    });

  };


})(jQuery);
