class Screencast < ActiveRecord::Base
	include PgSearch
	has_attached_file :video
	has_attached_file :image_principale

	belongs_to :categorie
	has_many :favoris
	pg_search_scope :search_titre, :against => [:titre], :using => {
                    :tsearch => {:prefix => true}
                  }
end
