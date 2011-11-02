# -*- encoding : utf-8 -*-
class CapaPortfolio < ActiveRecord::Base
  belongs_to :projeto
  has_many :seos, :as => :seoable

  image_accessor :cover
end
