# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

remove_fields = (link) ->
  $(link).prev('input[type=hidden]').val '1'
  $(link).closest('.form-fields').hide()
  return

add_fields = (link, association, content) ->
  new_id = (new Date).getTime()
  regexp = new RegExp('new_' + association, 'g')
  $(link).siblings(".user_fields").append content.replace(regexp, new_id)
  return

$(document).ready ->
  $('.user_fields').on 'click', '.link_to_remove_fields', ->
    event.preventDefault()
    link = $(this)
    remove_fields link
    return
  $('.link_to_add_fields').click (event) ->
    event.preventDefault()
    link = $(this)
    association = $(this).data('association')
    content = $(this).data('content')
    add_fields link, association, content
    return
