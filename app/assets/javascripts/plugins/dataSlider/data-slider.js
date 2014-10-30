$("[data-slider]")
  .each(function () {
    var input = $(this);
    $("<span>")
      .addClass("output")
			.addClass("h2")
      .insertAfter($(this));
  })
  .bind("slider:ready slider:changed", function (event, data) {
    $(this)
      .nextAll(".output:first")
        .html(data.value.toFixed(1));
  });