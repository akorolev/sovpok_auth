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
//= require jquery-fileupload
//= require third_party/owl.carousel
// Note: Foundation 5 won't work with turbolinks
//= require foundation
//= require_tree .
$(function() {
    $(document).foundation();
});
// TODO REMOVE ?
$("[data-match-height]").each(function() {

  var parentRow = $(this),
      childrenCols = $(this).find("[data-height-watch]"),
      childHeights = childrenCols.map(function(){ return $(this).height(); }).get(),
      tallestChild = Math.max.apply(Math, childHeights);

  childrenCols.css('min-height', tallestChild);

});

$(document).ready(function($) {
    $(".owl-carousel").owlCarousel({
        itemsCustom : [
            [0, 2],
            [840, 3],
            [1120, 4],
            [1400, 5],
            [1680, 6],
            [1960, 7],
            [2240, 8],
            [2800, 9]
        ],
        lazyLoad : true,
        slideSpeed : 100,
        paginationSpeed: 100,
        rewindSpeed: 500,
        paginationNumbers: true,
        navigation : true
    });
});

