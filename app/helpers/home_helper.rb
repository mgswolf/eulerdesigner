# -*- encoding : utf-8 -*-
module HomeHelper
  def ultimos_projetos
    @projetos = Projeto.recente.limit(5)
  end

  def ultimos_trabalhos
    @trabalhos = Trabalho.recente.limit(5)
  end
end
