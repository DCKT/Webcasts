module ApplicationHelper
	def get_gravatar_url
		if user_signed_in?
			email = current_user.email
			md5_email = Digest::MD5.hexdigest(email.downcase)
			@gravatar_image = "http://www.gravatar.com/avatar/#{md5_email}"
		end
	end
end
