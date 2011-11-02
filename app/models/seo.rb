# -*- encoding : utf-8 -*-
class Seo < ActiveRecord::Base
  belongs_to :seoable, :polymorphic => true
end
