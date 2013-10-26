$ ->
	$('ul.menu-list li').click (e) ->
		$this = $(@)
		$('ul.menu-list li').removeClass('active')
		$this.addClass('active')
		value = $this.data('value')
		titre = $this.data('titre')
		$('.box').remove()
		$('.soon').remove()
		$('.content h1').text(titre)

		if value != "soon"
			$.ajax 
				url: "/screencasts-videos"
				type: "POST"
				data:
					type: value 
				success: (datas) ->
					for data in datas.screencasts
						id = data.id
						titre = "<div class='titre'>#{data.titre}</div>"
						image = "<img src='#{data.image_principale}' alt='#{data.titre}' title='#{data.titre}' />"
						div = "<div class='box'><a href='/screencasts/#{id}'>#{image}#{titre}</a></div>"
						$('.box-list').append(div)
				error: ->
					$('.flash').remove()
					$('.flash_message').append('<div class="flash flash-error">Impossible de charger les informations, merci de signaler cette erreur</div>')
		else
			template = HandlebarsTemplates['a_venir']
			$('.box-list').append(template)
		

