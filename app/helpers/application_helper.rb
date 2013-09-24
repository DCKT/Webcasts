module ApplicationHelper
	def get_avatar_url(user)
		unless user.avatar.url == "/avatars/original/missing.png"
			@url = user.avatar.url
		else
			email = user.email
			md5_email = Digest::MD5.hexdigest(email.downcase)
			@url = "http://www.gravatar.com/avatar/#{md5_email}"
		end
	end

	def to_slug(string)
		#strip the string
		ret = string.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '').gsub('--', '')

		ret
	end
end
