class HomeController < ApplicationController
  def index
    @is_map = true
    @projects = Project.all
  end
  
  def about
  end

  def contact
  end
end
