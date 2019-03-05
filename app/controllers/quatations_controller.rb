class QuatationsController < ApplicationController


    def new 
        @quatation = Quatation.new
    end 
    def create
        @quatation = Quatation.new
      
    end


end
