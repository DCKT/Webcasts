class AddTitreSlugToScreencast < ActiveRecord::Migration
  def change
    add_column :screencasts, :titre_slug, :string
  end
end
