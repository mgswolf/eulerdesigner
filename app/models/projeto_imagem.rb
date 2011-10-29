class ProjetoImagem < ActiveRecord::Base
  belongs_to :projeto
  image_accessor :imagem

  validates :imagem_uid, :imagem_name, :presence => true
end

