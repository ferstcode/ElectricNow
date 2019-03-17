
ActiveAdmin.register Quatation do
    menu priority: 4
    
    index do
    column :electric
    column :detail
    column :amount
    column :date
    column :hour
    column :state_mode
   
    actions
    end
    
    
    filter :date
    filter :hour
    filter :state_mode, as: :select, collection: proc { Quatation.state_modes}
    
    
    form title: 'Editar' do |f|
    f.semantic_errors *f.object.errors.keys
    inputs 'Details' do

    input :user_id, label: 'Electric', as: :select, collection: User.where(role: :electric).map{|u| ["#{u.name}", u.id]}

    input :detection_id, label: 'Detection', as: :select, collection: Detection.all.map{|d| ["#{d.detail}", d.id]}
    input :detail
    input :amount
   
    input :state_mode    
    
    li "Quatation was created at #{f.object.created_at}" unless f.object.new_record?
    li "Quatation was updated at #{f.object.updated_at}" unless f.object.new_record?
    end
    #panel 'Markup' do
    # "The following can be used in the content below..."
    #end
    #para "Press cancel to return to the list without saving."
    actions
    end
    controller do       
        def create 
          
            detection_id = params[:quatation][:detection_id]       

            if detection_id.present?
                detection = Detection.find(detection_id)
                params[:quatation][:hour] = detection.hour
                params[:quatation][:date] = detection.date
                
            end  
            super
        end    
        
    end

    permit_params do
        permitted = [:detail, :amount, :state_mode, :user_id, :detection_id, :hour, :date]
        #permitted << :other if params[:action] == 'create' && current_user.admin?
        permitted
    end
    
    end