class SobreController < ApplicationController
  def index
    @sobre = Sobre.last
  end
end
