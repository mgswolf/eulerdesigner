# -*- encoding : utf-8 -*-
class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new
    respond_to do |format|
      format.html
    end
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
        redirect_to '/admin'
    else
      render 'new'
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Deslogado com sucesso!"
    redirect_to '/'
  end
end
