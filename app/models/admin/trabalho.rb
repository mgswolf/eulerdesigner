class Admin::Trabalho < ActiveRecord::Base
  has_one :seo, :as => :seoable, :dependent => :destroy
  has_one :side_cover, :dependent => :destroy
  accepts_nested_attributes_for :seo
  accepts_nested_attributes_for :side_cover, :reject_if => lambda { |a| a['cover'].blank? },:allow_destroy => true
  
 image_accessor :cover
 
   default_scope order(:titulo)
  scope :recente, order("created_at DESC")
end
