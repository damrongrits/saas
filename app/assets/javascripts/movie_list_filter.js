var MovieListFilter = {
  filter_R: function () {
    // 'this' is *unwrapped* element that received event (checkbox)
    if ($(this).is(':checked')) {
      $('tr.R').show();
    } else {
      $('tr.R').hide();
    };
  },
  filter_G: function () {
    // 'this' is *unwrapped* element that received event (checkbox)
    if ($(this).is(':checked')) {
      $('tr.G').show();
    } else {
      $('tr.G').hide();
    };
  },
  filter_PG: function () {
    // 'this' is *unwrapped* element that received event (checkbox)
    if ($(this).is(':checked')) {
      $('tr.PG').show();
    } else {
      $('tr.PG').hide();
    };
  },
  filter_PG13: function () {
    // 'this' is *unwrapped* element that received event (checkbox)
    if ($(this).is(':checked')) {
      $('tr.PG-13').show();
    } else {
      $('tr.PG-13').hide();
    };
  },
  setup: function() {
    // construct checkbox with label
    var labelAndCheckboxR =
      $('<label for="filter">R</label>' +
        '<input type="checkbox" id="filterR" checked/>' );
    labelAndCheckboxR.insertBefore('#movies');
    $('#filterR').change(MovieListFilter.filter_R);

    var labelAndCheckboxG =
      $('<label for="filter">G</label>' +
        '<input type="checkbox" id="filterG" checked/>' );
    labelAndCheckboxG.insertBefore('#movies');
    $('#filterG').change(MovieListFilter.filter_G);
    var labelAndCheckboxPG =
      $('<label for="filter">PG</label>' +
        '<input type="checkbox" id="filterPG" checked/>' );
    labelAndCheckboxPG.insertBefore('#movies');
    $('#filterPG').change(MovieListFilter.filter_PG);

    var labelAndCheckboxPG13 =
      $('<label for="filter">PG-13</label>' +
        '<input type="checkbox" id="filterPG13" checked/>' );
    labelAndCheckboxPG13.insertBefore('#movies');
    $('#filterPG13').change(MovieListFilter.filter_PG13);
  }
}
$(MovieListFilter.setup); // run setup function when document ready
