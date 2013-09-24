# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('.connected').click (event) ->
		event.preventDefault()
		$('.panel').slideToggle('fast')

	$('body').on 'focus', '.search input', ->
		$(@).animate
			'width': '200px'
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
				$('a.fav').addClass('active')
			error: ->
				alert('error')

	$('#clear').click (e) ->
		e.preventDefault()
		$('.search-results').slideUp("fast")
		$('.result').remove()
		$('.search input').val('')

	$('#search').keypress (e) ->
		if e.which == 13
			query = $(@).val()

			$.ajax
				url: '/search'
				type: "POST"
				data:
					query: query
				success: (datas) ->
					$('.result').remove()
					results = []
					for data in datas[0]
						results.push 
							titre: data.titre
							id: data.id

					for data, i in datas[1]
						results[i].img_url = data

					for result in results
						titre = "<div class='titre'><h3>#{result.titre}</h3></div>"
						img = "<img src='#{result.img_url}' />"
						link = "<a href='/screencasts/#{result.id}'> #{titre}#{img}</a>"
						html = "<div class='result'>#{link}</div>"
						$('.search-results').append(html)
					$('.search-results').slideDown()

