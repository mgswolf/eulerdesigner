module SobreHelper

  def projeto_desenvolvimento
    @projetos = Projeto.desenvolvimento.limit(2)
    if @projetos.blank?
      @projetos = Projeto.recente.limit(2)
    end
  end
end
