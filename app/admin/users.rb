ActiveAdmin.register User do
  
    menu priority: 2 # so it's on the very left
    
    #Actions in view
    #actions :all, except: [:update]
    index do
        column :name
        column :email
        column :rut
        column :address
        column :role
        actions
    end
    
    filter :name
    filter :email
    filter :rut
    filter :address
    filter :role, as: :select, collection: proc { User.roles.except :guest}
    
    
    form title: 'Editar' do |f|
        f.semantic_errors *f.object.errors.keys
        inputs 'Details' do
            input :name
            input :email
            if f.object.new_record?
                input :rut
            end
            input :address
            input :role, as: :select, collection: User.roles.except(:guest).keys.map{|r| [r.capitalize,r]}

    
            #if f.object.new_record?
            f.input :password
            f.input :password_confirmation
            #end
            li "El usuario fue creado el #{f.object.created_at}" unless f.object.new_record?
            li "El usuario fue actualizado el #{f.object.updated_at}" unless f.object.new_record?
        end
        #panel 'Markup' do
        # "The following can be used in the content below..."
        #end
        #para "Press cancel to return to the list without saving."
        actions
       
    end
    controller do       
        def update 
            if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
                params[:user].delete("password")
                params[:user].delete("password_confirmation")
            end  
            super
        end    
        
    end
    
    permit_params do
        permitted = [:name, :email, :rut, :address, :role, :password]
        #permitted << :other if params[:action] == 'create' && current_user.admin?
        permitted
    end
    
end