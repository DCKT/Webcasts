class AddScreencastIdToCommentaires < ActiveRecord::Migration
  def change
    add_column :commentaires, :screencast_id, :integer
  end
end
