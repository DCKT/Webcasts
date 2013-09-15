class AddFirstnameAndLastnameToUser < ActiveRecord::Migration
  def change
    add_column :users, :nom, :string
    add_column :users, :prenom, :string
  end
end
