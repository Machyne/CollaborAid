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
  #Sectors
  field :sectors, :type => Array
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

  def to_mapbox
    dscrp = '<p><strong>Implementing Organization:</strong><span>' +
            self.oversee +
            '</span><strong>Primary Beneficiaries:</strong><span>' +
            self.bens.join(", ") +
            '</span><strong>Sectors:</strong><span>' +
            self.sectors.join(", ") +
            '</span><strong>Description:</strong><span>' +
            self.description +
            '</span></p><small>Click <a href="/projects/' +
            self.id + '">here</a> to see more</small>'
    return {
      type: 'Feature',
      properties: {
          title: '<h1>'+self.name+'</h1>',
          :'marker-color' => '#f00',
          :'marker_size' => 'large',
          description: dscrp
      },
      geometry: {
          type: 'Point',
          coordinates: self.location
      }
    }
  end
end
