class FavorisController < ApplicationController
	before_filter :user_connected?, only: [:new, :mes_favoris, :delete]

	def new
		unless params[:screencast_id].empty?
			id = params[:screencast_id]
			@favoris = Favori.create(user_id: current_user.id, screencast_id: id)

			if @favoris.save
				redirect_to :back
			else
				flash[:error] = "Erreur lors de l'ajout !"
				redirect_to :back
			end
		end
	end

	def mes_favoris
		screens = current_user.favoris
		@screencasts = []

		screens.each do |screen|
			@screencasts << screen.screencast
		end
	end

	def delete
		id = params[:screencast_id].to_i
		current_user.favoris.each do |f|
			if f.screencast_id == id
				@favori = Favori.find(f.id)
				@favori.destroy
				flash[:notice] = "Votre favori a bien été supprimé !"
				redirect_to :back
			end
		end
	end

	private
		def user_connected?
			unless user_signed_in?
				redirect_to "/"
			end
		end
end
