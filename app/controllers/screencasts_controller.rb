class ScreencastsController < ApplicationController
	before_filter :user_connected?, only: [:new, :create, :edit, :update]

	def index
		if user_signed_in?
			@screencasts = Screencast.order('created_at DESC').page(params[:page]).per(9)
		else
			@screencasts = Screencast.order('created_at DESC').page(params[:page]).per(5)
		end

		@categories = Categorie.all

		respond_to do |format|
      		format.html # index.html.erb
      		format.js
    	end
	end

	def new
		@screencast = Screencast.new
	end

	def create
		@screencast = Screencast.new post_params
		@screencast.titre_slug = @screencast.titre.to_slug

		if @screencast.save
			redirect_to @screencast

		else
			render "new"
		end
	end

	def show
		@screencast = Screencast.find params[:id]
		@isFav = false

		if user_signed_in?
			current_user.favoris.each do |f|
				if f.screencast_id == @screencast.id
					@isFav = true
				end
			end
		end
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

	def search
		if params[:query]
			screencasts = Screencast.search_titre(params[:query])
			
			respond_to do |format|
				format.json { render json: screencasts}
			end
		end
	end

	def get_last_videos
		if params[:type] != "all"
			categorie = params[:type]
			@screencasts = Screencast.where(categorie_id: categorie)
		else
			@screencasts = Screencast.order('created_at DESC').page(params[:page]).per(9)	
		end

		respond_to do |format|
			format.json { render json: @screencasts}
		end
	end


	private 
		def post_params
			params.require(:screencast).permit(:titre, :description, :video, :image_principale, :categorie_id, :premium, :titre_slug)
		end

		def user_connected?
			unless user_signed_in?
				redirect_to "/"
			end
		end
end
