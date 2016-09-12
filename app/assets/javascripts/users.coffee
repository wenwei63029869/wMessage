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
        $('.user-section').hide()
        $('.room-section').show()
      error: (error) ->
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
        $('.user-section').hide()
        $('.room-section').show()
      error: (error) ->
        console.log error.responseText
  $('.logout-link').on 'click', (event) ->
    event.preventDefault()
    that = this
    $.ajax
      url: "/logout"
      type: "DELETE"
      dataType: "JSON"
      success: (data) ->
        $(that).parent().hide()
        $('.room-section').hide()
        $('.user-section').show()
      error: (error) ->
        console.log error.responseText

