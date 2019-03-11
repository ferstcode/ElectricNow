class QuatationsController < ApplicationController
    before_action :set_detection, only: %i[create new]


    def new       
        @hora = @detection.hour.strftime('%H:%M')
        @dia = @detection.date.strftime('%d-%m-%Y')
        @quatation = Quatation.new
        respond_to :js
    end
    def show
        @detection = Detection.find(params[:detection_id])
        @quatations = @detection.quatations.all

      
    end
    
    def create       
        @quatation = Quatation.new(
            user: current_user,
            detection: Detection.find(params[:detection_id]), 
            detail: params[:quatation][:detail],
            amount: params[:quatation][:amount],
            date: @detection.date,
            hour: @detection.hour,
            state_mode: 1
        )
        @quatation.save 
        respond_to :js
    end
      

    private 
    def set_detection
        @detection = Detection.find(params[:detection_id])
    end
    def quatation_params
        params_require(:quatation).permit(:detail, :amount)
    end
end




