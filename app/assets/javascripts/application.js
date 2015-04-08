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
//= require jquery-ui/effect.all
//= require turbolinks
// Load all Bootstrap JavaScript
//= require bootstrap-sprockets

//= require_tree .

$( document ).ready(function() {

    $("#country").autocomplete({
        source: '/countries/autocomplete',
        minLength: 2,
        select: function( event, ui ) {
            $("#city-field").fadeIn(200);
            $("#city").autocomplete({
                source: '/cities/' + ui.item.country_id + '/autocomplete'
            });
            console.log(event);
            console.log(ui.item.label);
            console.log(ui.item.value);
        }
    });

//    $('.comment').mouseover(
//        function() {
//            $('.edit-comment').css( "opacity", "1" );
//            $('.delete-comment').css( "opacity", "1" );
//    });
//    $('.comment').mouseleave(
//        function() {
//            $('.edit-comment').css( "opacity", "0" );
//            $('.delete-comment').css( "opacity", "0" );
//    });
});


