$ ->
  room = $('#messages').data('room')
  user = $('#messages').data('user')
  
  App.room = App.cable.subscriptions.create {channel:"RoomChannel", room: room},
    connected: ->
      # Called when the subscription is ready for use on the server
      console.log "connected to cable"
      @init()

    disconnected: ->
      # Called when the subscription has been terminated by the server
      console.log "disconnected from cable"

    received: (data) ->
      # Called when there's incoming data on the websocket for this channel
      $('#messages-list ul').append '<li>'+ data['user']+ ' :  '+ data['message'] + '</li>'
      console.log data

    send_message: (user, message) ->
      @perform 'send_message', message: message, user: user

    init: ->
      $(document).on 'keypress', '[data-behaviour=speaker]', (e) ->
        if e.keyCode is 13 && e.target.value.trim()
          App.room.send_message user, e.target.value
          e.target.value = ''
          e.preventDefault()
      
      $('#send-message').on 'click', (e) ->
        message = $('#message-input').val().trim()
        if message
          App.room.send_message user, message
          $('#message-input').val ''
          $('#message-input').focus()
          e.preventDefault()
