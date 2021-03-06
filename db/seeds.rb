# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.all.delete{|p|p.delete}

proj = Project.create
proj.name = "Project 1"
proj.location = [36.266837,36.563945]
proj.sectors = ["Health", "Food", "Civil Society"]
proj.oversee = "NGO 4"
proj.bens = ["Women"]
proj.descripts = "Lorem ipsum dolor"  
proj.description = "Lorem ipsum dolor sit amet,  . Aliquam in mollis dolor. senectus et netus et malesuada fames ac turpis egestas."
proj.initdate = Date.parse("Jan 11")
proj.funders = ["USAID"]
proj.save

proj = Project.create
proj.name = "Project 2"
proj.location = [36.263307,36.571584]
proj.sectors = ["Food", "Agriculture"]
proj.oversee = "NGO 4"
proj.bens = ["Children"]
proj.descripts = "consectetur adipiscing elit"
proj.description = "consectetur adipiscing elit. Nulla non tortor eu libero scelerisque convallis."
proj.initdate = Date.parse("Dec 13")
proj.funders = []
proj.save

proj = Project.create
proj.name = "Project 3"
proj.location = [36.259985,36.569095]
proj.sectors = ["Civil Society", "Health", "Education", "Water and Sanitation"]
proj.oversee = "NGO 1"
proj.bens = ["Men"]
proj.descripts = "Quisque enim tortor"
proj.description = "Quisque enim tortor, lacinia et vestibulum vitae ullamcorper sit amet orci"
proj.initdate = Date.parse("Feb 13")
proj.funders = []
proj.save

proj = Project.create
proj.name = "Project 4"
proj.location = [36.273134,36.574073]
proj.sectors = ["Education", "Agriculture", "Economic Development"]
proj.oversee = "NGO 2"
proj.bens = ["Ex-combatants"]
proj.descripts = "Proin ac quam"
proj.description = "Proin ac quam eget turpis tincidunt pulvinar. Praesent adipiscing vestibulum purus ut sodales. Pellentesque habitant morbi tristique "
proj.initdate = Date.parse("Apr 12")
proj.funders = ["DFID"]
proj.save

proj = Project.create
proj.name = "Project 5"
proj.location = [36.25957,36.582999]
proj.sectors = ["Water and Sanitation", "Environment", "Shelter and Housing"]
proj.oversee = "NGO 3"
proj.bens = ["Not specified"]
proj.descripts = "Vestibulum blandit,"
proj.description = "Vestibulum blandit, urna eu posuere sollicitudin, augue metus pretium mauris, quis euismod orci nunc vitae purus. Vivamus bibendum odio quis rhoncus lacinia."
proj.initdate = Date.parse("Mar 12")
proj.funders = []
proj.save

proj = Project.create
proj.name = "Project 6"
proj.location = [36.276837,36.563945]
proj.sectors = ["Agriculture", "Human Rights", "Media", "Other"]
proj.oversee = "NGO 6"
proj.bens = ["Families"]
proj.descripts = "Lorem ipsum dolor"
proj.description = "Lorem ipsum dolor sit amet,  . Aliquam in mollis dolor. senectus et netus et malesuada fames ac turpis egestas. "
proj.initdate = Date.parse("Jan 11")
proj.funders = ["USAID", "DFID"]
proj.save

proj = Project.create
proj.name = "Project 7"
proj.location = [36.283307,36.571584]
proj.sectors = ["Economic Development", "Other"]
proj.oversee = "NGO 5"
proj.bens = ["Businesses"]
proj.descripts = "consectetur adipiscing elit"
proj.description = "consectetur adipiscing elit. Nulla non tortor eu libero scelerisque convallis."
proj.initdate = Date.parse("Dec 13")
proj.funders = []
proj.save

proj = Project.create
proj.name = "Project 8"
proj.location = [36.29985,36.569095]
proj.sectors = ["Environment", "Media"]
proj.oversee = "NGO 1"
proj.bens = ["Other"]
proj.descripts = "Quisque enim tortor"
proj.description = "Quisque enim tortor, lacinia et vestibulum vitae, ullamcorper sit amet orci"
proj.initdate = Date.parse("Feb 13")
proj.funders = []
proj.save

proj = Project.create
proj.name = "Project 9"
proj.location = [36.213134,36.574073]
proj.sectors = ["Shelter and Housing", "Environment", "Media"]
proj.oversee = "NGO 2"
proj.bens = ["Ex-combatants", "Women"]
proj.descripts = "Proin ac quam"
proj.description = "Proin ac quam eget turpis tincidunt pulvinar. Praesent adipiscing vestibulum purus ut sodales. Pellentesque habitant morbi tristique "
proj.initdate = Date.parse("Apr 12")
proj.funders = ["DFID"]
proj.save

proj = Project.create
proj.name = "Project 10"
proj.location = [36.2957,36.582999]
proj.sectors = ["Human Rights"]
proj.oversee = "NGO 3"
proj.bens = ["Women", "Children"]
proj.descripts = "Vestibulum blandit,"
proj.description = "Vestibulum blandit, urna eu posuere sollicitudin, augue metus pretium mauris, quis euismod orci nunc vitae purus. Vivamus bibendum odio quis rhoncus lacinia."
proj.initdate = Date.parse("Mar 12")
proj.funders = []
proj.save

proj = Project.create
proj.name = "Project 11"
proj.location = [36.283307,36.51584]
proj.sectors = ["Media", "Food"]
proj.oversee = "NGO 4"
proj.bens = ["Men", "Ex-combatants"]
proj.descripts = "consectetur adipiscing elit"
proj.description = "consectetur adipiscing elit. Nulla non tortor eu libero scelerisque convallis."
proj.initdate = Date.parse("Dec 13")
proj.funders = []
proj.save

proj = Project.create
proj.name = "Project 12"
proj.location = [36.29985,36.59095]
proj.sectors = ["Other"]
proj.oversee = "NGO 1"
proj.bens = ["Businesses", "Families"]
proj.descripts = "Quisque enim tortor"
proj.description = "Quisque enim tortor, lacinia et vestibulum vitae, ullamcorper sit amet orci"
proj.initdate = Date.parse("Feb 13")
proj.funders = []
proj.save