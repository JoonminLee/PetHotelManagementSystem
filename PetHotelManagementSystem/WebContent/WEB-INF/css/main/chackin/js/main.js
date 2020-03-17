(function($) {

	'use strict';


  // aos
  AOS.init({
    duration: 1000
  });


  var dateAndTime = function() {
    $('#m_date').datepicker({
      'format': 'yyyy-mm-dd',
      'autoclose': true
    });
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
	var nowTemp = new Date();
	var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

	var checkin = $('#checkin_date').datepicker({

	  beforeShowDay: function(date) {
	    return date.valueOf() >= now.valueOf();
	  },
	  autoclose: true

	}).on('changeDate', function(ev) {
	  if (ev.date.valueOf() > checkout.datepicker("getDate").valueOf() || !checkout.datepicker("getDate").valueOf()) {

	    var newDate = new Date(ev.date);
	    newDate.setDate(newDate.getDate() + 1);
	    checkout.datepicker("update", newDate);

	  }
	  $('#checkout_date')[0].focus();
	});


	var checkout = $('#checkout_date').datepicker({
	  beforeShowDay: function(date) {
	    if (!checkin.datepicker("getDate").valueOf()) {
	      return date.valueOf() >= new Date().valueOf();
	    } else {
	      return date.valueOf() > checkin.datepicker("getDate").valueOf();
	    }
	  },
	  autoclose: true

	}).on('changeDate', function(ev) {});


})(jQuery);
