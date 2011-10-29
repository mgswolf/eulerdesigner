class User < ActiveRecord::Base
  acts_as_authentic
  extend FriendlyId
  friendly_id :login, :use => :slugged
end
