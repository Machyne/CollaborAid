class Project
  include Mongoid::Document

  #SEARCH 
  #Project Name
  field :name
  #Project Contact Name
  field :cname
  #Project Contact Email
  field :cemail
  #Project Location Name
  field :locname
  #Location for Map
  field :location, :type => Array  # [lat,lng]
  index( { location: Mongo::GEO2D }, { min: -180, max: 180 })
  #USAGE: Project.within_circle( location: [ center, radious ] )
  #   or  Project.geo_near(center).max_distance(radious)
  #Primary Sector
  field :psector
  #Additional Sectors
  field :asectors, :type => Array
  #Overseeing Organization
  field :oversee
  #Primary Beneficiaries
  field :bens, :type => Array

  #NO SEARCH
  #Description of Project
  field :description
  #Start Date
  field :initdate, :type => Date
  #End Date
  field :enddate, :type => Date
  #Funding Affiliation
  field :funders, :type => Array
end
