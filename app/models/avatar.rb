# -*- encoding : utf-8 -*-
class Avatar < ActiveRecord::Base
  belongs_to :sobre

  has_attached_file :imagem, :styles => { :medium => "117x353>", :thumb => "100x100>" },
  :path => ":rails_root/public/system/avatar/:filename"



end
