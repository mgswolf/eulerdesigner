class Projeto < ActiveRecord::Base

  has_many :projeto_imagems
  has_many :profissionals
  has_one :side_cover
  has_one :capa_portfolio

  accepts_nested_attributes_for :capa_portfolio
  accepts_nested_attributes_for :side_cover
  accepts_nested_attributes_for :projeto_imagems, :reject_if => lambda { |a| a['imagem'].blank? },:allow_destroy => true
  accepts_nested_attributes_for :profissionals, :reject_if => lambda { |a| a['nome'].blank? },:allow_destroy => true

  image_accessor :cover

  extend FriendlyId
  friendly_id :titulo, :use => :slugged

  default_scope order(:titulo)
  scope :recente, order("created_at DESC")
  scope :site, where(:categoria => "Site")
  scope :impresso, where(:categoria => "Impresso")
  scope :logo, where(:categoria => "Logotipo")
  scope :outro, where(:categoria => "Outro")
  scope :desenvolvimento, where(:status => "Desenvolvimento")

end

