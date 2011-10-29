class Admin::SobresController < ApplicationController
   before_filter :require_user 
  before_filter :get_about, :only=>[:show,:edit,:update,:destroy]
  layout 'admin'
  def index
    @sobres = Sobre.all
  end
  
  def show
  end
  
  def new
    @sobre = Sobre.new
    8.times { @sobre.avatars.build } 
  end
  
  def edit
    8.times { @sobre.avatars.build } 
  end

  def create
    @sobre = Sobre.new(params[:sobre])
    if @sobre.save
      redirect_to([:admin, @sobre],:notice =>"Informações cadastradas com sucesso") 
    else
      render 'new'  
    end
  end
  
  def update
    if @sobre.update_attributes(params[:sobre])
      redirect_to([:admin,@sobre],:notice => "Informações atualizadas com sucesso") 
    else
      render 'edit'
    end    
  end
  
  def destroy
    @sobre.destroy
  end
  
  private
  
  def get_about
    @sobre= Sobre.find(params[:id])
  end
end
