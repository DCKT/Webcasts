class Screencast < ActiveRecord::Base
	include PgSearch
	has_attached_file :video
	has_attached_file :image_principale

	belongs_to :categorie
	has_many :favoris
	has_many :commentaires, dependent: :destroy
	pg_search_scope :search_titre, :against => [:titre], :using => {
                    :tsearch => {:prefix => true}
                  }
end
