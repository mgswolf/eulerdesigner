# -*- encoding : utf-8 -*-
class Admin::UsersController < ApplicationController
  before_filter :load_users, :only => [:show, :edit, :update, :destroy]
    layout 'admin'
  # GET /users
  # GET /users.xml
  def index
    @users = User.paginate(:per_page => 20, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to([:admin,@user], :notice => 'user was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to([:admin,@user], :notice => 'user was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(admin_users_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def load_users
    @user = User.find(params[:id])
  end
end
