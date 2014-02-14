# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

readURL = (input) ->
  if input.files and input.files[0]
    reader = new FileReader()
    reader.onload = (e) ->
      $("#previewHolder").attr "src", e.target.result
      return

    reader.readAsDataURL input.files[0]
  return

$("#profile_avatar").change ->
  readURL this
  return
