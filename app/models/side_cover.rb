class SideCover < ActiveRecord::Base
  belongs_to :trabalho
  has_one :seo, :as=> :seoable, :dependent => :destroy
  accepts_nested_attributes_for :seo

  has_attached_file :imagem, :styles => { :medium => "255x62#", :thumb => "100x100>" }

end
