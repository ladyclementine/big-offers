// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


// $(window).scroll(function() {
	
// 	  var url;
	
// 	  // Checks if products are currently being loaded
// 	  if (window.pagination_loading) {
// 		return;
// 	  }
	
// 	  // Grabs the URL from the "next page" button 
// 	  url = $('.pagination .next_page').attr('href')
	
// 	  // Chckes if you're n height from the bottom
// 	  if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
	
// 		// Variable to know that you are currently loading products
// 		window.pagination_loading = true;
	
// 		// Text while loading
// 		$('.pagination').text('');
	
// 		// Run the script
// 		return $.getScript(url).always(function() {
// 		  return window.pagination_loading = false;
// 		});
	
// 	  }
// 	});