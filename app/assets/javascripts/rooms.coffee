# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('.room-link').on 'click', (e) ->
		e.preventDefault()
		room = $(this).find('.room-name').text()
		$('#room_name').val(room)
		

