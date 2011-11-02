class Admin::TrabalhosController < ApplicationController
layout 'admin'  
   before_filter :require_user 
  before_filter :get_trabalho, :only=>[:show,:edit,:update,:destroy]
# GET /admin/trabalhos
  # GET /admin/trabalhos.json
  def index
    @admin_trabalhos = Admin::Trabalho.paginate(:per_page => 15, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb

    end
  end

  # GET /admin/trabalhos/1
  # GET /admin/trabalhos/1.json
  def show
    @admin_trabalho = Admin::Trabalho.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb

    end
  end

  # GET /admin/trabalhos/new
  # GET /admin/trabalhos/new.json
  def new
        @admin_trabalho = Admin::Trabalho.new
      @side_cover = @admin_trabalho.build_side_cover
      @seo = @admin_trabalho.build_seo

    respond_to do |format|
      format.html # new.html.erb

    end
  end

  # GET /admin/trabalhos/1/edit
  def edit

  end

  # POST /admin/trabalhos
  # POST /admin/trabalhos.json
  def create
    @admin_trabalho = Admin::Trabalho.new(params[:admin_trabalho])

    respond_to do |format|
      if @admin_trabalho.save
        format.html { redirect_to @admin_trabalho, notice => 'Trabalho was successfully created.' }

      else
        format.html { render  "new" }

      end
    end
  end

  # PUT /admin/trabalhos/1
  # PUT /admin/trabalhos/1.json
  def update


    respond_to do |format|
      if @admin_trabalho.update_attributes(params[:admin_trabalho])
        format.html { redirect_to @admin_trabalho, notice => 'Trabalho was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render "edit" }

      end
    end
  end

  # DELETE /admin/trabalhos/1
  # DELETE /admin/trabalhos/1.json
  def destroy
    @admin_trabalho.destroy

    respond_to do |format|
      format.html { redirect_to admin_trabalhos_url }

    end
  end
  
  private
   def get_trabalho
    @admin_trabalho = Admin::Trabalho.find(params[:id])
  end
end
