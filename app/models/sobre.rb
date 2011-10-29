class Sobre < ActiveRecord::Base
  has_many :avatars
  has_many :socials

    accepts_nested_attributes_for :avatars, :reject_if => lambda { |a| a['imagem'].blank? }, :allow_destroy => true
 accepts_nested_attributes_for :socials, :reject_if => lambda { |a| a['url'].blank? }, :allow_destroy => true

  validates :nome, :descricao, :presence => true
  validates :nome, :uniqueness => true
end

