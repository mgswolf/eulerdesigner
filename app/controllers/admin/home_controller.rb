class Admin::HomeController < ApplicationController
  before_filter :require_user
  layout 'admin'

  def index
    
  end
end
