module HomeHelper

  def ultimos_trabalhos
    @projetos = Projeto.recente.limit(5)
  end
end
