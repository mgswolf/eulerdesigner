# -*- encoding : utf-8 -*-
class ProjetoImagem < ActiveRecord::Base
  belongs_to :projeto
  has_one :seo, :as=> :seoable, :dependent => :destroy
  accepts_nested_attributes_for :seo

  image_accessor :imagem


  validates :imagem_uid, :imagem_name, :presence => true
end

