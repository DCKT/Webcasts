# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('.connected').click (event) ->
		event.preventDefault()
		$('.panel').slideToggle('fast')

	$('aside').css('height', $(document).height() - 80)

	window.onresize = ->
		$('aside').css('height', window.innerHeight - 80)




	$('#clear').click (e) ->
		e.preventDefault()
		$('.search-results').slideUp("fast")
		$('.result').remove()
		$('.search input').val('')

	$('.dismiss').click (e) ->
		$('.flash').slideUp()

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
					
					for data in datas.screencasts
						titre = "<div class='titre'><h3>#{data.titre}</h3></div>"
						img = "<img src='#{data.image_principale}' />"
						link = "<a href='/screencasts/#{data.slug}'> #{titre}#{img}</a>"
						html = "<div class='result'>#{link}</div>"
						$('.search-results').append(html)
					$('.search-results').slideDown()


