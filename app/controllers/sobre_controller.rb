# -*- encoding : utf-8 -*-
class SobreController < ApplicationController
  def index
    @sobre = Sobre.last
  end
end
