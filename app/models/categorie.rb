class Categorie < ActiveRecord::Base
	has_many :screencasts, dependent: :destroy
end

