$(document).on "turbolinks:load", ->
  $('.login-button').on 'click', (event) ->
    event.preventDefault()
    that = this
    input = $('.user-form').find('input[name=username]')
    $.ajax
      url: "/login"
      type: "POST"
      data: {user: {username: input.val()}}
      dataType: "JSON"
      success: (data) ->
        input.val("")
        $('.navbar-text').show()
        $('.navbar-text span').text('Sign in as ' + data["username"] + ' ')
        $('.user-section').hide()
        $('.room-section').show()
      error: (error) ->
        input.val("")
        console.log error.responseText
  $('.signup-button').on 'click', (event) ->
    event.preventDefault()
    that = this
    input = $('.user-form').find('input[name=username]')
    $.ajax
      url: "/users"
      type: "POST"
      data: {user: {username: input.val()}}
      dataType: "JSON"
      success: (data) ->
        input.val("")
        $('.navbar-text').show()
        $('.navbar-text span').text('Sign in as ' + data["username"] + ' ')
        $('.user-section').hide()
        $('.room-section').show()
      error: (error) ->
        input.val("")
        console.log error.responseText
  $('.logout-link').on 'click', (event) ->
      that = this
      $.ajax
        url: "/logout"
        type: "DELETE"
        dataType: "JSON"
        success: (data) ->
          if $('.room-section').length == 0
            $('.home-button')[0].click()
          else
            event.preventDefault()
            $(that).parent().hide()
            $('.room-section').hide()
            $('.user-section').show()
        error: (error) ->
          console.log error.responseText

