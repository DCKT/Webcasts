class ScreencastsController < ApplicationController
	def index
		if user_signed_in?
			email = current_user.email
			md5_email = Digest::MD5.hexdigest(email.downcase)
			@gravatar_image = "http://www.gravatar.com/avatar/#{md5_email}"
		end
	end

	def new
		@screencast = Screencast.new
	end

	def create
		@screencast = Screencast.new post_params

		if @screencast.save
			redirect_to @screencast

		else
			render "new"
		end
	end

	def show
		@screencast = Screencast.find params[:id]
	end

	private 
		def post_params
			params.require(:screencast).permit(:titre, :video)
		end
end
