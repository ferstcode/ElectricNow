class UsersController < ApplicationController
    

    def index 
        @electrics = User.electrics
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
           
        @sum = 0
        @qualifications.each do |q|            
            @sum += q.calification
        end 
        count = @qualifications.count
        @prom = @sum/((count > 0) ? count : 1)
        end
        if current_user.client?
            @detections_client = Detection.where(user_id: current_user.id)
            @detections_electric_id = @detections_client.where('electric_id is not null')
            @detections_all= @detections_client.where(electric_id: nil)        
        end
    end
    

end