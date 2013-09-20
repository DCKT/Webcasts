class AddSlugToScreencast < ActiveRecord::Migration
  def change
    add_column :screencasts, :slug, :string
  end
end
