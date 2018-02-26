ActiveAdmin.register TeamMember do
  menu parent: 'General'
  permit_params :name, :surname, :position, :email, :phone, :password, :password_confirmation, :branch, :social, :profile_image, :branch

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  form do |f|
    f.inputs do
      f.input :branch, collection: ['Eduinternational', 'Baku', 'Kiev', 'Lviv', 'Odessa', 'Tbilisi', 'Tirana']
      f.input :name
      f.input :surname
      f.input :position
      f.input :email
      f.input :phone
      f.input :social
      f.input :password
      f.input :password_confirmation
      f.input :profile_image

    end
    f.actions
  end

end
