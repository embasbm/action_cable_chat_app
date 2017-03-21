class AddAttachmentIconToDialects < ActiveRecord::Migration
  def self.up
    change_table :dialects do |t|
      t.attachment :icon
    end
  end

  def self.down
    remove_attachment :dialects, :icon
  end
end
