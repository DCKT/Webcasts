class Screencast < ActiveRecord::Base

	include PgSearch
	has_attached_file :video
	has_attached_file :image_principale, styles: { large: "500x500>", medium: "300x300>", small: "220x220>" }

	belongs_to :categorie
	has_many :favoris
	has_many :commentaires, dependent: :destroy
	pg_search_scope :search_titre, :against => [:titre], :using => {
                    :tsearch => {:prefix => true}
                  }

	def active_model_serializer
		ScreencastSerializer
	end
end
