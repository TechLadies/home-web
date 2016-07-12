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
//= require bootstrap-sprockets
//= require jquery_ujs
//= require jquery-ui
//= require cocoon
//= require select2
//= require_tree .

apply_select_2 = function() {
  $('.case_file_issues_tag_id select').select2({
    ajax: {
      url: "/tags",
      dataType: 'json',
      delay: 2
    },
    width: '100%'
  });
}

onPhotoUpload = function(event) {
  $('#link_filename').val(event.fpfile.filename);
  $('#link_mimetype').val(event.fpfile.mimetype);
  $('#link_size').val(event.fpfile.size);
  $('#new_link').submit();
}

$(document).ready(function() {

  $('[data-toggle="popover"]').popover();

  $('body').on('.simple_form.edit_case_file cocoon:after-insert, .simple_form.new_case_file cocoon:after-insert', function(e, insertedItem) {
    apply_select_2();
  });

  $('.select2').select2();

  apply_select_2();

  $('body').on('focus', '.datepicker', function() {
    $(this).datepicker({
      dateFormat: 'dd/mm/yy',
      changeYear: true,
      yearRange: '-100:+0'
    });
  });

  var hash = $.trim(window.location.hash);
  if (hash) {
    $('.nav-tabs a[href="' + hash + '"]').tab('show');
  } else {
    $('.nav-tabs a:first').tab('show');
  }

});
