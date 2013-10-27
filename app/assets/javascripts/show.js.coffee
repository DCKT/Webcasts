$ ->
	

	url = $('#a240e92d').data('image')
	$('#a240e92d').attr('poster', url)
	sublime.ready ->
		player = sublime('a240e92d')
		player.setSize($('.content').width(), 450)

		window.onresize = ->
			player.setSize($('.content').width(), 450)


	$('a.fav').click (event) ->
		event.preventDefault()
		$this = $(@)
		img = $this.find('img')
		id = $(img).data('id')
		isFav = $this.data('fav')

		if $(@).data('fav') == true
			url = "/delete-favori"
			message = "Favoris supprimé !"
		else
			url = '/nouveau-favori'
			message = "Favoris ajouté !"

		$.ajax 
			url: url
			type: "POST"
			data:
				screencast_id: id
			success: ->
				$('a.fav').toggleClass('active')
				$('.tooltip').text(message)
				$('.tooltip').fadeIn()
				setTimeout ( ->
					$('.tooltip').fadeOut()
				), 1000
				if isFav 
					$this.data('fav', false)
				else
					$this.data('fav', true)
			error: ->
				alert('error')