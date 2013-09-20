class AddPremiumToScreencast < ActiveRecord::Migration
  def change
    add_column :screencasts, :premium, :boolean
  end
end
