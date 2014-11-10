// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require cocoon
//= require bootstrap
//= require moment
//= require bootstrap-datetimepicker
//= require fullcalendar
//= require bootstrap-wysihtml5
//= require bootstrap-wysihtml5/locales
//= require plugins/stickyTabs/stickytabs
//= require plugins/dataTables/jquery.dataTables.js
//= require plugins/dataTables/dataTables.bootstrap.js
//= require plugins/metisMenu/metisMenu.min
//= require plugins/numberSpinner/numberspinner
//= require plugins/mask/jquery.mask
//= require plugins/switch/bootstrap-switch
//= require plugins/dataSlider/data-slider
//= require plugins/modalDelete/modal-delete
//= require select2
//= require sb-admin-2
//= require inits/select2
//= require inits/mask
//= require inits/switch
//= require inits/datepicker

$(document).ready( function () {
    $('#datatable').DataTable();
} );

$(document).ready(function(){

  $('.wysihtml5').each(function(i, elem) {
    $(elem).wysihtml5();
  });

})