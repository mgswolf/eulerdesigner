class Admin::TrabalhosController < ApplicationController
  layout 'admin'
  before_filter :require_user
  before_filter :get_trabalho, :only=>[:show,:edit,:update,:destroy]
  # GET /admin/trabalhos
  # GET /admin/trabalhos.json
  def index
    @trabalhos = Trabalho.paginate(:per_page => 15, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb

    end
  end

  # GET /admin/trabalhos/1
  # GET /admin/trabalhos/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb

    end
  end

  # GET /admin/trabalhos/new
  # GET /admin/trabalhos/new.json
  def new
    @trabalho = Trabalho.new
    @side_cover = @trabalho.build_side_cover
    @seo = @trabalho.build_seo

    respond_to do |format|
      format.html # new.html.erb

    end
  end

  # GET /admin/trabalhos/1/edit
  def edit
    @side_cover = @trabalho.build_side_cover if @trabalho.side_cover.nil?
  end

  # POST /admin/trabalhos
  # POST /admin/trabalhos.json
  def create
    @trabalho = Trabalho.new(params[:trabalho])

    respond_to do |format|
      if @trabalho.save
        format.html { redirect_to [:admin,@trabalho], notice => 'Trabalho was successfully created.' }

      else
        format.html { render  "new" }

      end
    end
  end

  # PUT /admin/trabalhos/1
  # PUT /admin/trabalhos/1.json
  def update

    respond_to do |format|
      if @trabalho.update_attributes(params[:trabalho])
        format.html { redirect_to [:admin,@trabalho], notice => 'Trabalho was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render "edit" }

      end
    end
  end

  # DELETE /admin/trabalhos/1
  # DELETE /admin/trabalhos/1.json
  def destroy
    @trabalho.destroy
     redirect_to admin_trabalhos_url
  end

  private

  def get_trabalho
    @trabalho = Trabalho.find(params[:id])
  end
end
