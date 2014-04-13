class HomeController < ApplicationController
  def index
    @is_map = true
    @projects = Project.all
  end
  
  def about
  end

  def addproject
  end

  def contact
  end
end
