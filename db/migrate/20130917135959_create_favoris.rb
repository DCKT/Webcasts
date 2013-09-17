class CreateFavoris < ActiveRecord::Migration
  def change
    create_table :favoris do |t|
      t.integer :user_id
      t.integer :screencast_id

      t.timestamps
    end
  end
end
