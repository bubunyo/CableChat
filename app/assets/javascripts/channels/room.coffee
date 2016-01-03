$ ->
  room = $('#messages').data 'room'
  user = $('#messages').data 'user'
  hex = $('#messages').data 'hex'
  connect_msg = '<span class="label label-success">Connected</span>';
  retrying_msg = '<span class="label label-warning">Retrying...</span>';
  disconnected_msg = '<span class="label label-danger">Disconnected</span>';
  
  App.room = App.cable.subscriptions.create {channel:"RoomChannel", room: room},
    connected: ->
      # Called when the subscription is ready for use on the server
      console.log "connected to cable"
      $('#chat-status').html connect_msg
      @init()

    disconnected: ->
      # Called when the subscription has been terminated by the server
      console.log "disconnected from cable"
      $('#chat-status').html disconnected_msg

    received: (data) ->
      # Called when there's incoming data on the websocket for this channel
      alignment = if user == data['user'] then ' pull-right' else ''
      inset = '<span class="label label-primary '+ data['hex'] + alignment + '">' + data['user']+ ' :  '+ data['message'] + '</span></br>'
      $('.messages-list #messages').append inset
      d = $('#messages')
      d.animate({ scrollTop: d[0].scrollHeight}, 200);

    send_message: (user, message, hex) ->
      @perform 'send_message', message: message, user: user, hex: hex

    init: ->
      $(document).on 'keypress', '[data-behaviour=speaker]', (e) ->
        if e.keyCode is 13 && e.target.value.trim()
          App.room.send_message user, e.target.value, hex
          e.target.value = ''
          e.preventDefault()
      
      $('#send-message').on 'click', (e) ->
        message = $('#message-input').val().trim()
        if message
          App.room.send_message user, message, hex
          $('#message-input').val ''
          $('#message-input').focus()
          e.preventDefault()
