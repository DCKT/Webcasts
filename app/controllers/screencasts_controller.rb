class ScreencastsController < ApplicationController
	before_filter :user_connected?, only: [:new, :create, :edit, :update, :destroy]

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
		@screencast.slug = @screencast.titre.gsub(" - ", "-").gsub(".", "-").gsub("--","-").gsub(" ", "-")

		if @screencast.save
			redirect_to screencast_path(@screencast.slug)

		else
			render "new"
		end
	end

	def show
		@screencast = Screencast.where(slug: params[:id])[0]

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
		@screencast.slug = post_params["titre"].gsub(" - ", "-").gsub(".", "-").gsub("--","-").gsub(" ", "-")

		if @screencast.update_attributes post_params
			redirect_to screencast_path(@screencast.slug)
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


	def destroy
		if current_user.admin
			@screencast = Screencast.find(params[:id])
			@screencast.destroy
			flash[:notice] = "Screencast supprimé !"
			redirect_to root_path
		end
	end

	private 
		def post_params
			params.require(:screencast).permit(:titre, :description, :video, :image_principale, :categorie_id, :premium, :slug)
		end

		def user_connected?
			unless user_signed_in?
				redirect_to "/"
			end
		end
end
