# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $(document).on 'click', '.comment .fa-edit', ->
    $(this).closest('.comment').find('.best_in_place').click()

  $(document).on 'ajax:success', '.comment .destroy-comment-btn', ->
    $(this).closest('.comment').remove()