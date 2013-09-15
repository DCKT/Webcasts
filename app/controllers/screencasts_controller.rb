class ScreencastsController < ApplicationController
	def index
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
