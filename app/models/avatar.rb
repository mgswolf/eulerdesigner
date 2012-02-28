# -*- encoding : utf-8 -*-
class Avatar < ActiveRecord::Base
  belongs_to :sobre

  has_attached_file :imagem, :styles => { :medium => "300x300>", :thumb => "100x100>" }



end

