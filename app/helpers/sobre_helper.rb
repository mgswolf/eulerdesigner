# -*- encoding : utf-8 -*-
module SobreHelper

  def trabalho_participo
    @trabalhos = Admin::Trabalho.recente.limit(2)
  end
  
end
