class PortfolioController < ApplicationController
  before_filter :get_projeto, :only=>[:show]
  before_filter :get_title, :except=>[:show]

  def index
    @projetos = Projeto.paginate(:per_page => 10, :page => params[:page])

  end
  
  def show
   @title= @projeto.titulo
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

  def get_title
    @title= "Portfólio contendo trabalhos de EulerDesign como criação de sites e sistemas, logotipos ou identidades visuais, impressos gráficos."
  end
end
