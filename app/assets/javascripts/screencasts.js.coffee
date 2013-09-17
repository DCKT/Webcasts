# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('.connected').click (event) ->
		event.preventDefault()
		$('.panel').slideToggle('fast')

	$('body').on 'focus', '.search input', ->
		$(@).animate
			'width': '250px'
			200

	$('.search input').blur ->
		$(@).animate
			'width': '150px'
			200		

	$('aside').css('height', $(document).height() - 80)

	window.onresize = ->
		$('aside').css('height', window.innerHeight - 80)


	$('a.fav').click (event) ->
		event.preventDefault()
		img = $(@).find('img')
		id = $(img).data('id')

		$.ajax 
			url: '/nouveau-favori'
			type: "POST"
			data:
				screencast_id: id
			success: ->
				alert('success')
			error: ->
				alert('error')

