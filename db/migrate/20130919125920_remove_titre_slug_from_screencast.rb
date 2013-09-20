class RemoveTitreSlugFromScreencast < ActiveRecord::Migration
  def change
  	remove_column :screencasts, :titre_slug
  end
end
