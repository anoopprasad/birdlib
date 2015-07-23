require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'

module  BirdsRepresenter
  include Roar::Representer::JSON::HAL
  include Roar::Representer::Feature::Hypermedia
  include Representable::JSON::Collection


  collection :birds , extend: BirdRepresenter, class: Bird




end
