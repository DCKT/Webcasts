class AddDescriptionToScreencast < ActiveRecord::Migration
  def change
    add_column :screencasts, :description, :text
  end
end
