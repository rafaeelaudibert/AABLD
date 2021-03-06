// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= _require rails-ujs
//= _require activestorage
//= _require turbolinks
//= _require_tree .
//= _require jquery 
//= _require jquery_ujs 
//= _require bootstrap-sprockets 
//= require best_in_place
//= require pickadate/picker
//= require pickadate/picker.date
//= require pickadate/picker.time
//= require pickadate/translations/pt_BR

$(document).ready(function() {
  /* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();

  /* Activating the PickADate datepicker*/
  $('.datepicker').pickadate({
    formatSubmit: 'yyyy-mm-dd',
    selectMonths: true,
    hiddenName: true
  });
});
