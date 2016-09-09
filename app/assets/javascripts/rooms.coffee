$(document).on "turbolinks:load", ->
  $('.room_form').on 'submit', (event) ->
    event.preventDefault()
    that = this
    inputs = $(that).serialize()
    console.log inputs
    $.ajax
      url: "/rooms"
      type: "POST"
      data: inputs
      dateType: "JSON"
      success: (data) ->
        $('#rooms').append data
        that.reset()
      error: (error) ->
        console.log error.responseText

  # $('#rooms').on 'click', (event) ->
  #   if $(event.target).is( "p" )
  #     event.preventDefault()
  #     roomId = event.target.id
  #     url = "/rooms/" + roomId
  #     $.ajax
  #       url: url
  #       type: "PUT"
  #       dateType: "JSON"
  #       success: (data) ->
  #         $('.room_box').empty().append data
  #       error: (error) ->
  #         console.log error.responseText

