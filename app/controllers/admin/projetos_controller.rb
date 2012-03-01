# -*- encoding : utf-8 -*-
class Admin::ProjetosController < ApplicationController
  before_filter :require_user
  before_filter :get_projeto, :only=>[:show,:edit,:update,:destroy]
  layout 'admin'
  def index
    @projetos = Projeto.all
  end

  def show
  end

  def new
    @projeto = Projeto.new
    capa_portfolio = @projeto.build_capa_portfolio
	  @seo = @projeto.build_seo
  end

  def edit
    capa_portfolio = @projeto.build_capa_portfolio unless @projeto.capa_portfolio
  end

  def create
    @projeto = Projeto.new(params[:projeto])
    if @projeto.save
      redirect_to([:admin, @projeto],:notice =>"Informações cadastradas com sucesso")
    else
      render 'new'
    end
  end

  def update
    if @projeto.update_attributes(params[:projeto])
      redirect_to([:admin, @projeto],:notice => "Informações atualizadas com sucesso")
    else
      render 'edit'
    end
  end

  def destroy
    @projeto.destroy
    redirect_to admin_projetos_url
  end

  private

  def get_projeto
    @projeto= Projeto.find(params[:id])
  end
end
