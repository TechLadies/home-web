$(function() {

  $('.select-people').select2({
    theme: 'bootstrap',

    ajax: {
      url: "/people",
      dataType: 'json',
      delay: 250,
      processResults: function (data, params) {

        //filters based on name
        var filtered = data.filter(function(item) {
          return item.name.toLowerCase().indexOf(params.term.toLowerCase()) > -1
        });

        // parse the results into the format expected by Select2
        // since we are using custom formatting functions we do not need to
        // alter the remote JSON data, except to indicate that infinite
        // scrolling can be used
        params.page = params.page || 1;


        return {
          results: filtered,
          pagination: {
            more: (params.page * 30) < data.length
          }
        };
      },
      cache: true
    },
    escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
    minimumInputLength: 1,
    templateResult: formatRepo,
    templateSelection: formatRepoSelection
  });

  function formatRepo (repo) {
    if (repo.loading) return repo.text;
    console.log('format')
    var markup = "<div class='select2-result-repository clearfix'>" +
      // "<div class='select2-result-repository__avatar'><img src='" + repo.name + "' /></div>" +
      "<div class='select2-result-repository__meta'>" +
      "<div class='select2-result-repository__title'><h3>" + repo.name + "</h3></div>";

    if (repo.email) {
      markup += "<div class='select2-result-repository__description'>" + repo.email + " </div>";
    }

    if (repo.phone) {
      markup += "<div class='select2-result-repository__description'>" + repo.phone + "</div>";
    }

    return markup;
  }

  function formatRepoSelection (repo) {
    return repo.text;
  };
});