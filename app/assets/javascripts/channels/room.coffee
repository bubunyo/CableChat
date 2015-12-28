App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log "connected to cable"

  disconnected: ->
    # window.location = "http://www.yoururl.com"
    # Called when the subscription has been terminated by the server
    console.log "disconnected from cable"

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    alert data.message

  send_message: (user, message) ->
    @perform 'send_message', message: message, user: user
