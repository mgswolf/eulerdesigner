# -*- encoding : utf-8 -*-
class ProjetoImagem < ActiveRecord::Base
  belongs_to :projeto
  has_one :seo, :as=> :seoable, :dependent => :destroy
  accepts_nested_attributes_for :seo

  has_attached_file :imagem, :styles => { :medium => "629x629>", :thumb => "100x100>" }
end

