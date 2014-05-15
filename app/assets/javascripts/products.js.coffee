# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
fileUploadErrors = undefined
url_submit_error = undefined
url_submit_success = undefined

url_submit_success = (data) ->
  content = undefined
  content = $(data).find("#url")
  $("#result").empty().append content
  $("#url_button").attr "disabled", false
  $("#upload_url").val ""
  $.getJSON $("#fileupload").prop("action"), (files) ->
    fu = undefined
    template = undefined
    fu = $("#fileupload").data("blueimpFileupload")
    template = undefined
    fu._adjustMaxNumberOfFiles -files.length
    console.log files
    template = fu._renderDownload([files[files.length - 1]]).appendTo($("#fileupload .files"))
    fu._reflow = fu._transition and template.length and template[0].offsetWidth
    template.addClass "in"
    return

  return

url_submit_error = (data) ->
  obj = undefined
  $("#url_button").attr "disabled", false
  obj = $.parseJSON(data.responseText)
  $("#upload_url").val "Image " + obj.upload.toString()
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
    maxFileSize: 500000
    acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i

  $.getJSON $("#fileupload").prop("action"), (files) ->
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