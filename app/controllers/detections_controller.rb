class DetectionsController < ApplicationController
    before_action :set_detection, only: [:show]

    def index
        @detections = Detection.all 
    end 

    def show
        @hora = @detection.hour.strftime('%H:%M')
        @dia = @detection.date.strftime('%d-%m-%Y')
      
    end
    
    def new 
        @detection = Detection.new
    end 
    
    def create
        @detection = Detection.new(                      
            user: current_user,            
            detail: params[:detection][:detail],
            amount: params[:detection][:amount],            
            image: params[:detection][:image],
            day: params[:detection][:day],
            hour: params[detection][:hour],
            state_mode: 1
            )
            @detection.save            
            
    end

    private 
    def set_detection
        @detection = Detection.find(params[:id])  
    end
      
    def detection_params
        params.require(:detection).permit(:detail, :email, amount, :day, :image, :hour)
    end

end
