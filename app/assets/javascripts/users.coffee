# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  tippy('#password-info.tippy', {position: 'right'}) # tippy tooltip for password info
  #########################
  # Password Strength Bar #
  #########################
  $(document).on 'keyup', '#password', ->
    eval_opts = ['weak', 'less-weak', 'less-weak', 'strong', 'strongest']
    password = $(this).val()
    zx_obj = zxcvbn(password)
    percentage = 100/(4/zx_obj.score) + '%'
    if password.length > 0
      $('#password-strength-bar').css('width', percentage)
      switch zx_obj.score
        when 4 # green
          $('.progress').addClass 'super-sayan'
          $('.progress .progress-bar').removeClass('bg-danger bg-warning').addClass('bg-success')
        when 3 # yellow
          $('.progress').removeClass 'super-sayan'
          $('.progress .progress-bar').removeClass('bg-danger bg-success').addClass('bg-warning')

        when 2 # yellow
          $('.progress').removeClass 'super-sayan'
          $('.progress .progress-bar').removeClass('bg-danger bg-success').addClass('bg-warning')

        when 1 # red
          $('.progress').removeClass 'super-sayan'
          $('.progress .progress-bar').removeClass('bg-warning bg-success').addClass('bg-danger')

        else
          $('.progress').removeClass 'super-sayan'

      # show warnings if there are any
      if zx_obj.feedback.warning != null && zx_obj.feedback.warning != undefined
        $('#password-suggestions').text zx_obj.feedback.warning
        $('.evaluation small').css('visibility', 'hidden') # hide all
        $("##{eval_opts[zx_obj.score]}-eval").css('visibility', 'visible') # show accurate one
    else # there is no text in the box
      $('#password-suggestions').text ''
      $('#password-strength-bar').css('width', '0%')
      $('.evaluation small').css('visibility', 'hidden') # hide all
      $('.progress').removeClass 'super-sayan'

App.messages = App.cable.subscriptions.create "PostCommentNotificationsChannel",
  received: (data) ->
    $('#messages').append data.message