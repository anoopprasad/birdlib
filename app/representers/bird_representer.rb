class  BirdRepresenter < Roar::Decorator
  include Roar::Representer::JSON::HAL



  property :id  
  property :name  
  property :family  
  property :continents
  property :added
  property :visible

  link :self do
    "http://lvh.me:3000/#{represented.id}.json"
  end

end
