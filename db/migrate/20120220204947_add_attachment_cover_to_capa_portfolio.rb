class AddAttachmentCoverToCapaPortfolio < ActiveRecord::Migration
  def self.up
    add_column :capa_portfolios, :cover_file_name, :string
    add_column :capa_portfolios, :cover_content_type, :string
    add_column :capa_portfolios, :cover_file_size, :integer
    add_column :capa_portfolios, :cover_updated_at, :datetime
  end

  def self.down
    remove_column :capa_portfolios, :cover_file_name
    remove_column :capa_portfolios, :cover_content_type
    remove_column :capa_portfolios, :cover_file_size
    remove_column :capa_portfolios, :cover_updated_at
  end
end
