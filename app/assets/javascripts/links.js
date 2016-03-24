$(function() {
  //initializes filepicker
  //kiv: set api key in config
  filepicker.setKey('AjoQpFm3BSYa3EcKB652Fz');

  //when upload button is clicked, filepicker uploads the file and returns a url
  //use ajax to create a new link based on the url
  $('#upload').click(function() {

    var $form = $('form:has(#upload)'),
      action = $form.attr('action'),
      method = $form.attr('method');

    //opens filepicker dialog
    filepicker.pick(function(blob) {
      var caseId = $('#caseId').attr('data-case-id'),
        data = $form.serializeArray();

      //blob.url stores the filestack url of saved file
      data.push({name: 'link[url]', value: blob.url});
      data.push({name: 'link[filename]', value: blob.filename});

      $.ajax({
        url: action,
        type: method,
        data: data
      });
    });
  });
});