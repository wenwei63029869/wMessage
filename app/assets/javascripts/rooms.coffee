$(document).on "turbolinks:load", ->
  $('.room_form').on 'submit', (event) ->
    event.preventDefault()
    that = this
    inputs = $(that).serialize()
    $.ajax
      url: "/rooms"
      type: "POST"
      data: inputs
      dataType: "HTML"
      success: (data) ->
        $('#rooms').append data
        that.reset()
      error: (error) ->
        console.log error.responseText

