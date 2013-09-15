class AddAttachmentVideoToScreencasts < ActiveRecord::Migration
  def self.up
    change_table :screencasts do |t|
      t.attachment :video
    end
  end

  def self.down
    drop_attached_file :screencasts, :video
  end
end
