class CommentairesController < ApplicationController
	def create
		@screencast = Screencast.find params[:screencast_id]
		@commentaire = @screencast.commentaires.create params[:commentaire].permit(:contenu, :user_id)

		redirect_to screencast_path(@screencast)
	end
end
