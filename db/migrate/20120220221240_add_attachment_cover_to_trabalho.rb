class AddAttachmentCoverToTrabalho < ActiveRecord::Migration
  def self.up
    add_column :trabalhos, :cover_file_name, :string
    add_column :trabalhos, :cover_content_type, :string
    add_column :trabalhos, :cover_file_size, :integer
    add_column :trabalhos, :cover_updated_at, :datetime
  end

  def self.down
    remove_column :trabalhos, :cover_file_name
    remove_column :trabalhos, :cover_content_type
    remove_column :trabalhos, :cover_file_size
    remove_column :trabalhos, :cover_updated_at
  end
end
