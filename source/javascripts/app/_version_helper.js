$(function() {
  var currentUrlContains = function(needle){
    return window.location.href.indexOf(needle) >= 0;
  };

  // this URL is not available at development time, but it's available on production.
  // If you change this JS, make sure it does not break switching on old pages.
  var xhr = $.ajax('../versions.json');
  xhr.done(function(data, textStatus, jqXHR) {
    var versionSwitcher = $('.version-switcher select');
    $(data).each(function(index, elem) {
      var optionText = elem.version;

      if (elem.type) {
        optionText += ' (' + elem.type + ')';
      }

      var isCurrentlyDisplayed = (elem.type === 'latest' && currentUrlContains('/current/')) || currentUrlContains("/" + elem.version + "/");

      var optionElem = $('<option>').attr({
        value: elem.version,
        selected: isCurrentlyDisplayed,
        'data-url': elem.location,
        'data-oldsite': elem.old_site
      }).text(optionText);

      versionSwitcher.append(optionElem);
    });

    versionSwitcher.on('change', function(e) {
      var currentPosition = window.location.hash;
      var selectedElem = $(e.target).find(":selected");
      var location = selectedElem.attr('data-url');
      var oldSite = selectedElem.attr('data-oldsite');
      if (!oldSite) {
        location = location + currentPosition;
      }
      window.location.href = location;
    });
  });
});
