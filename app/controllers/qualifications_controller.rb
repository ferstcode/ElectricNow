class QualificationsController < ApplicationController

    def index 
        @electric = User.find(params[:electric_id])
        @qualifications = @electric.electric_qualifications.all
        @sum = 0
        @qualifications.each do |q|
            @sum += q.calification
        end
        count = @qualifications.count
        @prom = @sum / ((count > 0) ? count : 1)
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
            detail: params[:detail],
            client_id: current_user.id,
            electric_id:params[:electric_id],
            calification: params[:calification]
           
        )
        @qualification.save
        puts @qualification.errors.messages
        respond_to :js
    end 

    private
    

    def qualification_params
        params.permit(:detail, :calification)
    end


end
