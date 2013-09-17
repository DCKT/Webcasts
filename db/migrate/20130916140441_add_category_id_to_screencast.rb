class AddCategoryIdToScreencast < ActiveRecord::Migration
  def change
    add_column :screencasts, :categorie_id, :integer
  end
end
