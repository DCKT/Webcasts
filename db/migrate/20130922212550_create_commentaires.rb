class CreateCommentaires < ActiveRecord::Migration
  def change
    create_table :commentaires do |t|
      t.text :contenu
      t.integer :user_id

      t.timestamps
    end
  end
end
