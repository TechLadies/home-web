$(function() {
  //initializes filepicker
  //kiv: set api key in config
  filepicker.setKey('AjoQpFm3BSYa3EcKB652Fz');

  //when upload button is clicked, filepicker uploads the file and returns a url
  //use ajax to create a new link based on the url
  $('#upload').click(function() {

    var $form = $(this).parent();

    //KIV: assumes parent of input is the form
    //added hackish error checking
    if (!$form.is('form')) {
      alert('ERROR: CHECK NESTING OF #UPLOAD BUTTON');
      return false;
    };

    filepicker.pick(function(blob) {
      var caseId = $('#caseId').attr('data-case-id'),
        data = $form.serializeArray();

      //blob.url stores the filestack url of saved file
      data.push({name: 'link[url]', value: blob.url});
      $.ajax({
        url: '/cases/' + caseId + '/links',
        type: 'POST',
        data: data
      });
    })
  });
});