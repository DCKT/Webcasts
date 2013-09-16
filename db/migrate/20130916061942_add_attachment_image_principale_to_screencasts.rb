class AddAttachmentImagePrincipaleToScreencasts < ActiveRecord::Migration
  def self.up
    change_table :screencasts do |t|
      t.attachment :image_principale
    end
  end

  def self.down
    drop_attached_file :screencasts, :image_principale
  end
end
