$(function() {
  $belongsToSelectize = $(".field-unit--belongs-to-selectize select");
  var data = $belongsToSelectize.data();

  if (data && data["remote"] === true) {
    data["load"] = function(query, callback) {
      if (!query.length) return callback();

      var q = data["search_param"] || "q";
      data["params"][q] = query;

      $.getJSON(data["url"], data["params"])
        .done(function(res) {
          callback(res);
        })
        .fail(function() {
          callback();
        });
    };
  }

  $belongsToSelectize.selectize(data);
});
