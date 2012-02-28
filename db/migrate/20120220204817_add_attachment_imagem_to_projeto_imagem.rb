class AddAttachmentImagemToProjetoImagem < ActiveRecord::Migration
  def self.up
    add_column :projeto_imagems, :imagem_file_name, :string
    add_column :projeto_imagems, :imagem_content_type, :string
    add_column :projeto_imagems, :imagem_file_size, :integer
    add_column :projeto_imagems, :imagem_updated_at, :datetime
  end

  def self.down
    remove_column :projeto_imagems, :imagem_file_name
    remove_column :projeto_imagems, :imagem_content_type
    remove_column :projeto_imagems, :imagem_file_size
    remove_column :projeto_imagems, :imagem_updated_at
  end
end
