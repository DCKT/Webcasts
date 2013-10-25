class CategoriesController < ApplicationController
	def new
		@categorie = Categorie.new
	end

	def create
		@categorie = Categorie.new post_params

		if @categorie.save
			redirect_to '/'
		else
			render "new"
		end
	end

	def index
		@categories = Categorie.all
	end

	def show
		@categorie = Categorie.where(name: params[:id])
	end

	private
		def post_params
			params.require(:categorie).permit(:nom)
		end
end
