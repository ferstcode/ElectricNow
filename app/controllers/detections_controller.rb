class DetectionsController < ApplicationController
    before_action :set_detection, only: [:show]

    def index
        @detections = Detection.all 
        @detections_client = Detection.where(user_id: current_user.id)
        
        respond_to :js
    end 

    def show
        @hora = @detection.hour.strftime('%H:%M')
        @dia = @detection.date.strftime('%d-%m-%Y')
      
    end
    
    def new
        @electric_id = params[:id]
        @detection = Detection.new
        respond_to :js
    end 
    
    def create
        @detection = Detection.new(                      
            user: current_user,            
            detail: params[:detection][:detail],                            
            image: params[:detection][:image],
            address: params[:detection][:address],
            commune: params[:detection][:commune],
            date: params[:detection][:date],
            hour: params[:detection][:hour],
            electric_id: params[:detection][:electric_id].present? ? params[:detection][:electric_id] : nil,
            state_mode: 1
            )
        @detection.save
        redirect_to user_profile_path(current_user)
    end

    private 
    def set_detection
        @detection = Detection.find(params[:id])  
    end
      
    def detection_params
        params.require(:detection).permit(:detail, :address, :comune, :date, :hour, :image)
    end

end
