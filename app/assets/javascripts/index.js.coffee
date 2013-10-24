$ ->
	$('ul.menu-list li').click (e) ->
		$('ul.menu-list li').removeClass('active')
		$(@).addClass('active')
		value = $(@).data('value')
		titre = $(@).data('titre')
		$('.box').remove()
		$('.soon').remove()
		
		if value != "soon"
			$.ajax 
				url: "/screencasts-videos"
				type: "POST"
				data:
					type: value 
				success: (datas) ->
					$('.content h1').text(titre)
					for data in datas.screencasts
						id = data.id
						titre = "<div class='titre'>#{data.titre}</div>"
						image = "<img src='#{data.image_principale}' alt='#{data.titre}' title='#{data.titre}' />"
						div = "<div class='box'><a href='/screencasts/#{id}'>#{image}#{titre}</a></div>"
						$('.box-list').append(div)
				error: ->
					console.log "Error"
		else
			template = HandlebarsTemplates['a_venir']
			$('.box-list').append(template)
		

