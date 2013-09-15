class Screencast < ActiveRecord::Base
	has_attached_file :video
end
