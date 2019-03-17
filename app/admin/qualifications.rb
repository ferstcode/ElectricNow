ActiveAdmin.register Qualification do
    actions :all, except: :new
    menu priority: 5
    index do
        column :client
        column :electric     
        column :detail
        column :calification
        column :created_at   
   
               
        actions
    end
    filter :electric
    filter :client
    filter :calification   
    
 
    


    form title: 'Editar' do |f|
        f.semantic_errors *f.object.errors.keys        
        inputs 'Details' do
            if f.object.new_record?
            else           
            input :detail    
            input :calification
            end
        end
        #panel 'Markup' do
        # "The following can be used in the content below..."
        #end
        #para "Press cancel to return to the list without saving."
        actions

    end
    
    permit_params do
        permitted = [:detail, :calification, :client_id, :electric_id]
        #permitted << :other if params[:action] == 'create' && current_user.admin?
        permitted
    end
    
    
    
end