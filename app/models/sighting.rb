class Sighting < ApplicationRecord
  belongs_to :location
  belongs_to :bird
end
