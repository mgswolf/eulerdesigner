# -*- encoding : utf-8 -*-
class Social < ActiveRecord::Base
  belongs_to :sobre
  has_one :seo, :as=> :seoable
  accepts_nested_attributes_for :seo

  has_attached_file :imagem, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates  :url, :nome, :presence => true
  validates :nome, :url, :uniqueness => true
end

