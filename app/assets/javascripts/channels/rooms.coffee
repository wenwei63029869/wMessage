jQuery(document).on 'turbolinks:load', ->
  messages = $('#messages')
  if $('#messages').length > 0
    messages_to_bottom = -> messages.scrollTop(messages.prop("scrollHeight"))
    messages_to_bottom()

    App.global_chat = App.cable.subscriptions.create {
        channel: "RoomsChannel"
        room_id: messages.data('room-id')
      },
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        console.log data
        messages.append data['message']
        messages_to_bottom()

      speak: (content, room_id, user_id) ->
        @perform 'speak', content: content, room_id: room_id, user_id: user_id
    $('#message_form').on 'submit', (event) ->
      that = $(this)
      content = that.find('input[name="content"]');
      App.global_chat.speak content.val(), $('#messages').data('room-id'), $('#messages').data('user-id')
      content.val('')
      event.preventDefault()
