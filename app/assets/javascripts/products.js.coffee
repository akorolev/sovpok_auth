# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  # For jquery.chained.js
  $("#product_sub_category_lvl1").chained "#product_sub_category_lvl0"
  $("#product_sub_category_lvl2").chained "#product_sub_category_lvl1"
  $("#product_sub_category_lvl3").chained "#product_sub_category_lvl2"
  $("#product_sub_category_lvl4").chained "#product_sub_category_lvl3"
  $("#product_sub_category_lvl5").chained "#product_sub_category_lvl4"
  $("#product_sub_category_lvl6").chained "#product_sub_category_lvl5"

fileUploadErrors = undefined
url_submit_error = undefined
url_submit_success = undefined

url_submit_success = (data) ->
  content = undefined
  fu = undefined
  template = undefined
  content = $(data).find("#url")
  $("#result").empty().append content
  $("#url_button").attr "disabled", false
  $("#upload_url").val ""
  fu = $("#fileupload").data("blueimpFileupload")
  template = fu._renderDownload([data.files[0]]).appendTo($("#fileupload .files"))
  fu._reflow = fu._transition and template.length and template[0].offsetWidth
  template.addClass "in"
  return

url_submit_error = (data) ->
  obj = undefined
  parent_div = undefined
  val = undefined
  $("#url_button").attr "disabled", false
  obj = $.parseJSON(data.responseText)
  parent_div = $("#upload_url").parent()
  val = "Image " + obj.photo.toString()
  parent_div.append("<span class='error'>"+val+"</span>");
  $("#upload_url").val ""

  return

fileUploadErrors =
  maxFileSize: "File is too big"
  minFileSize: "File is too small"
  acceptFileTypes: "Filetype not allowed"
  maxNumberOfFiles: "Max number of files exceeded"
  uploadedBytes: "Uploaded bytes exceed file size"
  emptyResult: "Empty file upload result"

$ ->
  $("#fileupload").fileupload
    autoUpload: true
    maxFileSize: 2100000
    acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i
    formData:
      product_id: $("#product_id").val()

  $.getJSON $("#fileupload").prop("action"), {product_id: $("#product_id").val()}, (files) ->
    fu = undefined
    template = undefined
    fu = $("#fileupload").data("blueimpFileupload")
    template = undefined
    fu._adjustMaxNumberOfFiles -files.length
    console.log files
    template = fu._renderDownload(files).appendTo($("#fileupload .files"))
    fu._reflow = fu._transition and template.length and template[0].offsetWidth
    template.addClass "in"
    $("#loading").remove()
    return

  return

$ ->
  $("#url_button").click ->
    val = undefined
    val = $("#upload_url").val()
    $("#url_button").attr "disabled", true
    $("#upload_url").val "Sending...."
    $.ajax
      type: "POST"
      url: "product_images/create_from_uri"
      data:
        url: val

      dataType: "json"
      success: url_submit_success
      error: url_submit_error

    return

  return

$("#submit_product").click ->
  value = $("input[name=\"main_image\"]:checked").val()
  $("#product_top_image").val(value)
  document.forms[0].submit()
  return