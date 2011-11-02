class SideCover < ActiveRecord::Base
  belongs_to :trabalho
  has_one :seo, :as=> :seoable, :dependent => :destroy
  accepts_nested_attributes_for :seo
    
  image_accessor :cover
    
end
