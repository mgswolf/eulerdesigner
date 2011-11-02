# -*- encoding : utf-8 -*-
class Profissional < ActiveRecord::Base
  belongs_to :projeto
  has_one :seo, :as=> :seoable
  accepts_nested_attributes_for :seo
end
