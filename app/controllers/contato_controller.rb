class ContatoController < ApplicationController
  def index
    
  end
  
  def enviar
     Mensageiro.contato(params[:nome],params[:email],params[:assunto],params[:origem],params[:mensagem]).deliver
    
    #redirect_to root_url, :notice=>"Seu email foi enviado, logo entraremos em contato."
    respond_to do |format|
      format.js
    end  
  end
end
