class RenameColumnTitleToTitre < ActiveRecord::Migration
  def change
  	rename_column :screencasts, :title, :titre
  end
end
