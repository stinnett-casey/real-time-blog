# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $(document).on 'keyup', '#friends-search', ->
    name = $(this).val()
    if name.length > 0
      $.post '/friendship_search', { name: name }, (html) ->
        # $('#search-results').html html
    else
      $('#search-results').empty()
    # Had to do this because if I typed while hovering on a name,
    # the tippy wouldn't disappear until clicking elsewhere.
    # This is that click.
    $('body').click()

  $(document).on 'ajax:send', '.friendship-request-form', ->
    console.log 'in ajax:send'
    $(this).find('input[type=submit]').val 'Doing it...'
  $(document).on 'ajax:success', '.friendship-request-form', ->
    console.log 'in ajax:success'
    $(this).find('input[type=submit]').val 'Done!'
     
    