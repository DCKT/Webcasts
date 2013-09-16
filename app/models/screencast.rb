class Screencast < ActiveRecord::Base
	has_attached_file :video
	has_attached_file :image_principale
end
