# -*- encoding : utf-8 -*-
class CapaPortfolio < ActiveRecord::Base
  belongs_to :projeto
  has_many :seos, :as => :seoable

  has_attached_file :cover, :styles => { :medium => "442×224>", :thumb => "100x100>" }
end
