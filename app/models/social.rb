# -*- encoding : utf-8 -*-
class Social < ActiveRecord::Base
  belongs_to :sobre
  has_one :seo, :as=> :seoable
  accepts_nested_attributes_for :seo

  image_accessor :imagem

  validates :imagem_uid, :imagem_name, :url, :nome, :presence => true
  validates :nome, :url, :uniqueness => true
end

