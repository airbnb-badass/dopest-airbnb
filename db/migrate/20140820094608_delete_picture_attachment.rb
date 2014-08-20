class DeletePictureAttachment < ActiveRecord::Migration
  def self.down
    change_table :apartments do |t|
      t.attachment :picture
    end
  end

  def self.up
    remove_attachment :apartments, :picture
  end
end
