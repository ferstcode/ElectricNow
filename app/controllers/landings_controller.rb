class LandingsController < ApplicationController


def index 
    @detections = Detection.all
    @electricos = User.where(role: :electric)
   
  
end 
    
end
