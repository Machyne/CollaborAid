class HomeController < ApplicationController
  def index
    @is_map = true
    @sectors = ['Health', 'Food', 'Civil Society', 'Education', 'Water and Sanitation', 'Agriculture', 'Economic Development', 'Environment', 'Shelter and Housing', 'Human Rights', 'Media', 'Other']
    @pbens = ['Women', 'Children', 'Men', 'Ex-combatants', 'Families', 'Businesses', 'Other']
    @projects = Project.all
  end
  
  def about
  end

  def addproject
  end

  def contact
  end
end
