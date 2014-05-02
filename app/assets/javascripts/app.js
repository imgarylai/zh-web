var form = $('#search_form');
form.submit(function(ev) {

  $.ajax({
    type: form.attr('method'),
    url: form.attr('action'),
    data: form.serialize(),
    success: function(data) {
      $("#result").html(data["result"]);
    }
  });
  ev.preventDefault();
});

