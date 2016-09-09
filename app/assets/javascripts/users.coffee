$(document).on "turbolinks:load", ->
  $('.user_form').on 'submit', (event) ->
    event.preventDefault()
    that = this
    inputs = $(that).serialize()
    console.log inputs
    $.ajax
      url: "/users"
      type: "POST"
      data: inputs
      dateType: "JSON"
      success: (data) ->
        that.reset()
        $(that).hide()
        $('.room-section').show()
      error: (error) ->
        console.log error.responseText

