# -*- encoding : utf-8 -*-
class PortfolioController < ApplicationController
  before_filter :get_projeto, :only=>[:show]
  before_filter :get_seo, :except=>[:show]
  def index
    @projetos = Projeto.paginate(:per_page => 10, :page => params[:page])

  end

  def show
    @title= @projeto.titulo
    @description= @projeto.seo.description unless @projeto.seo.nil?
  end

  def sites
    @projetos = Projeto.site.paginate(:per_page => 10, :page => params[:page])
  end

  def impressos
    @projetos = Projeto.impresso.paginate(:per_page => 10, :page => params[:page])
  end

  def logotipos
    @projetos = Projeto.logo.paginate(:per_page => 10, :page => params[:page])
  end

  def outros
    @projetos = Projeto.outro.paginate(:per_page => 10, :page => params[:page])
  end

  private

  def get_projeto
    @projeto= Projeto.find(params[:id])
  end

  def get_seo
    @title= "Portfólio contendo trabalhos de EulerDesign como criação de sites e sistemas, logotipos ou identidades visuais, impressos gráficos."
    @description= "Veja alguns dos meus trabalhos"
  end
end
