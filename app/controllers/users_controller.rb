class UsersController < ApplicationController

    def electrics 
        @electrics = User.where(role: :electric)
        @electric = User.find(params[:user_id])
        @qualification = Qualification.new
    end
    
    def show
        @detections = Detection.all     
        @electrics = User.where(role: :electric) 
        @result={}
        @electrics.each do |electric|
            sum = 0
            electric.electric_qualifications.each do |q|
              sum += q.calification            
            end
            count = electric.electric_qualifications.count
            prom = sum/((count > 0) ? count : 1)
            @result[electric.id]=prom
        end
        if current_user.electric?
        @electric =  current_user
        @qualifications = @electric.electric_qualifications
        end   
        @sum = 0
        @qualifications.each do |q|            
            @sum += q.calification
        end 
        count = @qualifications.count
        @prom = @sum/((count > 0) ? count : 1)
    end
    

end