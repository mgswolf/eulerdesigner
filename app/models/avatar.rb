# -*- encoding : utf-8 -*-
class Avatar < ActiveRecord::Base
  belongs_to :sobre
  image_accessor :imagem do
    storage_path{ "/avatar/#{imagem_name}" } 
  end

  validates :imagem, :presence => true



end

