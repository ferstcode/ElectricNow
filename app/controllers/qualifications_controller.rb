class QualificationsController < ApplicationController

    def index 
        @electric = User.find(params[:electric_id])
        @qualifications = @electric.electric_qualifications.all 
        
    end 
    def show
       
      
    end

    def new 
        @electric = User.find(params[:electric_id])
        @qualification = Qualification.new
        respond_to :js
    end

    def create 
        @qualification = Qualification.new(
            detail: params[:qualification][:detail],
            client_id: current_user.id,
            electric_id: User.find(params[:electric_id]),
            calification: params[:qualification][:calification]
           
        )
        @qualification.save 
        respond_to :js
    end 

    private
    

    def qualification_params
        params.require(:qualification).permit(:detail, :calification)
    end
    

end
