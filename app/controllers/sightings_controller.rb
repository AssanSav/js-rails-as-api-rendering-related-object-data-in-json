class SightingsController < ApplicationController
    def index 
        sightings = Sighting.all 
        render json: sightings.to_json(:include => { :bird => {:only=> [:name, :species]},:location => { :only => [:latitude, :longetude]}}, :except => [:created_at, :updated_at]) 
    end
    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting
            render json: sighting.to_json(:include => { :bird => { :only => [:name, :species]}, :location => { :only => [:latitude, :longitude]}}, :except => [:updated_at]) #{id: sighting.id, bird: sighting.bird, location: sighting.location }
        else
            render json: {message: "No record was found"}
        end
    end
end
