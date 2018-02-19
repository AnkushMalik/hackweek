// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.atwho
//= require mousetrap
//= require jquery-hotkeys
//= require bootstrap
//= require selectize
//= require jquery.table-filter.js
//= require jquery.swipebox.js

$(function() {
  // add a hash to the URL when the user clicks on a tab
  $('a[data-toggle="tab"]').on('click', function(e) {
    history.pushState(null, null, $(this).attr('href'));
  });
  // navigate to a tab when the history changes
  window.addEventListener("popstate", function(e) {
    var activeTab = $('a[href="' + location.hash + '"]');
    if (activeTab.length) {
      activeTab.tab('show');
    } else {
      $('.nav-tabs a').first().tab('show');
    }
  });
});

$(function() {
    var hash = window.location.hash;
    hash && $('ul.nav a[href="' + hash + '"]').tab('show');
});

$(function() {
  $('#show-preview').click(
    function() {
      var text = $('.markdown-source-text').val();
      $.ajax('/markdown/preview.js?source=' + encodeURIComponent(text));
    });
});

$(function() {
  $('#show-source').click(
    setTimeout(
      function () {
        $('#preview-contents').addClass('hidden');
        $('#loading-spinner').removeClass('hidden');
      }, 200
    )
  );
});
