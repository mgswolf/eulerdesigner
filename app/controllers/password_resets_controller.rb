# -*- encoding : utf-8 -*-
class PasswordResetsController < ApplicationController
    before_filter  :load_user_using_perishable_token, :only => [ :edit, :update ]
   before_filter :require_no_user
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user
      @user.deliver_password_reset_instructions!
      redirect_to(root_path, :notice=>"As Instruções para redefinir sua senha foram enviadas para você")
    else
      #redirect_to 'new', :notice=>"Nenhum usuário foi encontrado com o endereço de email #{params[:email]}"
     redirect_to('/password_resets/new', :alert =>"Usuario não encontrado!")
    end
  end

  def edit

  end

  def update

    @user.password = params[:password]
    # Only if your are using password confirmation
    # @user.password_confirmation = params[:password]
    if @user.save
      redirect_to(root_url, :notice =>"Sua senha foi atualizada com sucesso")
    else
      render 'edit'
    end
  end


  private

  def load_user_using_perishable_token
    @user = User.find_by_perishable_token(params[:id])
    unless @user
      redirect_to(root_url, :notice=>"Lamentamos, mas não conseguimos localizar a sua conta")
    end
  end
end
