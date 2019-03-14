class MessagesController < ApplicationController

    def new 
        @quatation = Quatation.find(params[:quatation_id])
        @messages= @quatation.messages.order(id: :desc)
        @message = Message.new 
        
        respond_to :js
    end
    def create 
        @quatation = Quatation.find(params[:quatation_id])
        if current_user.client? 
            @message =Message.new(
                client_id: current_user.id,
                content: params[:message][:content],                
                quatation_id: params[:quatation_id]
            )
        else
            @message =Message.new(
                electric_id: current_user.id,
                content: params[:message][:content],                
                quatation_id: params[:quatation_id] 
            )
        end 
        @message.save
        respond_to :js      
    end 
    def index
      

    end 
    def show 
        
    end 




    private 
    def message_params
        params.require(:message).permit(:content)
    end
    
end

