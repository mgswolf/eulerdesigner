class SideCover < ActiveRecord::Base
  belongs_to :projeto
  image_accessor :cover
end
