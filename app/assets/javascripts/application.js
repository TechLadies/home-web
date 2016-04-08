// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require bootstrap-sprockets
//= require turbolinks
//= require jquery_ujs
//= require cocoon
//= require select2
//= require_tree .
<<<<<<< HEAD
//= require select2
=======

apply_select_2 = function() {
	$('.simple_form.edit_case_file select').select2({
	  ajax: {
	    url: "/tags",
	    dataType: 'json',
	    delay: 250,
	    cache: true
	  }
	});
}

ready = function() {

	apply_select_2();

	$('body').on('.simple_form.edit_case_file cocoon:after-insert', function(e, insertedItem) {
		apply_select_2();
	});

};

$(document).ready(ready);
$(document).on('page:load', ready);
>>>>>>> 5a2a9b8b7d9d4fc724623846806490d7a7587981
