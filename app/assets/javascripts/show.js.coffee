$ ->
	url = $('#a240e92d').data('image')
	$('#a240e92d').attr('poster', url)
	sublime.ready ->
		player = sublime('a240e92d')
		player.setSize($('.content').width(), 450)

		window.onresize = ->
			player.setSize($('.content').width(), 450)
