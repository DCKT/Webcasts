$ ->
	$('#new_user').submit (event) ->
		event.preventDefault()

		$.ajax
			type: 'POST'
			url: '/users/sign_in'
			data:
				user:
					email: $("#user_email").val()
					password: $('#user_password').val()
					remember_me: $('#user_remember_me').val()
			success: ->
				window.location = "/"
			error: ->
				$('#login-error').slideDown()
				$('#user_password').val('')
