class Trabalho < ActiveRecord::Base
  has_one :seo, :as => :seoable, :dependent => :destroy
  has_one :side_cover, :dependent => :destroy
  accepts_nested_attributes_for :seo
  accepts_nested_attributes_for :side_cover, :reject_if => lambda { |a| a['imagem'].blank? },:allow_destroy => true

  has_attached_file :cover, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  default_scope order(:titulo)
  scope :recente, order("created_at DESC")
end
