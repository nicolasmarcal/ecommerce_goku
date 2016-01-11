class Admin::AdminController < ApplicationController
  before_action :authenticate_admin_user!

  layout "admin"
  def index
    
  end
end