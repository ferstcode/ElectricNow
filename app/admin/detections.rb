
ActiveAdmin.register Detection do
    menu priority: 3
    index do
        column :client
        
        column :detail
        column :address
        column :commune
        column :state_mode
        column "Date of visit", :date        
        
        
        column "Assigned", :electric_id do |d|
            if d.electric_id.present?
                User.find(d.electric_id)
            else
                "-"
            end
        end       
               
        actions
    end
    filter :date
    filter :client
    filter :commune    
    filter :state_mode, as: :select, collection: proc { Detection.state_modes}
 
    


    form title: 'Editar' do |f|
        f.semantic_errors *f.object.errors.keys
        inputs 'Details' do
            input :detail
            input :state_mode
            input :hour 
            input :date
            input :address
            input :commune 
                   
            
            input :latitude
            input :longitude             
            input :user_id, as: :select, collection: User.where(role: :client) 
            input :electric_id, as: :select, collection: User.where(role: :electric) 

    
           
        end
        #panel 'Markup' do
        # "The following can be used in the content below..."
        #end
        #para "Press cancel to return to the list without saving."
        actions
       
    end
    permit_params do
        permitted = [:detail, :address, :commune, :state_mode, :longitude, :latitude, :user_id, :electric_id, :date, :hour]
        #permitted << :other if params[:action] == 'create' && current_user.admin?
        permitted
    end
    
    
    
end