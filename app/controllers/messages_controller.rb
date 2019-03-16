class MessagesController < ApplicationController

    def new 
        @quatation = Quatation.find(params[:quatation_id])
        @messages = @quatation.messages.order(id: :desc)
        if current_user.client?
            @unread_messages = @messages.where(read: false, client_id: nil)
        elsif current_user.electric?
            @unread_messages = @messages.where(read: false, electric_id: nil)            
        end
        @unread_messages.update_all(read: true) if @unread_messages.present?
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
    



    private 
    def message_params
        params.require(:message).permit(:content)
    end
    
end

