class ScreencastsController < ApplicationController
	before_filter :user_connected?, only: [:new, :create, :edit, :update]
	
	def index
		@screencasts = Screencast.order('created_at DESC')
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
		@screencasts = Screencast.where(categorie_id: @screencast.categorie.id)
	end

	def edit
		@screencast = Screencast.find params[:id]
	end

	def update
		@screencast = Screencast.find params[:id]

		if @screencast.update_attributes post_params
			redirect_to @screencast
		else
			render 'edit'
		end
	end
	private 
		def post_params
			params.require(:screencast).permit(:titre, :video, :image_principale, :categorie_id)
		end

		def user_connected?
			unless user_signed_in?
				redirect_to "/"
			end
		end
end
