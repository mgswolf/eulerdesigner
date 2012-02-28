# -*- encoding : utf-8 -*-
class Projeto < ActiveRecord::Base

  has_many :projeto_imagems, :dependent => :destroy
  has_many :profissionals, :dependent => :destroy
  has_one :capa_portfolio, :dependent => :destroy
  has_one :seo, :as=> :seoable, :dependent => :destroy

  accepts_nested_attributes_for :capa_portfolio, :reject_if => lambda { |a| a['cover'].blank? },:allow_destroy => true
  accepts_nested_attributes_for :seo
  accepts_nested_attributes_for :projeto_imagems, :reject_if => lambda { |a| a['imagem'].blank? },:allow_destroy => true
  accepts_nested_attributes_for :profissionals, :reject_if => lambda { |a| a['nome'].blank? },:allow_destroy => true

  has_attached_file :cover, :styles => { :medium => "300x300>", :thumb => "100x100>" }

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

