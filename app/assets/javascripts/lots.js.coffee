# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$("#datetimepicker").datetimepicker
  format:'d.m.Y H:i'
  minDate:'0'
  allowTimes: [ "9:00"
  "10:00"
  "11:00"
  "12:00"
  "13:00"
  "14:00"
  "15:00"
  "16:00"
  "17:00"
  "18:00"
  "19:00"
  "20:00"
  "21:00"
  "22:00"
  ]

$ ->
  # For jquery.chained.js 
  $("#lot_sub_category_lvl1").chained "#lot_sub_category_lvl0"
  $("#lot_sub_category_lvl2").chained "#lot_sub_category_lvl1"
  $("#lot_sub_category_lvl3").chained "#lot_sub_category_lvl2"
  $("#lot_sub_category_lvl4").chained "#lot_sub_category_lvl3"
  $("#lot_sub_category_lvl5").chained "#lot_sub_category_lvl4"
  $("#lot_sub_category_lvl6").chained "#lot_sub_category_lvl5"
  #return

$ ->
  $('#show_pickup').on "change", ->
    $("#pickup").toggle @checked
    return
  return

 
