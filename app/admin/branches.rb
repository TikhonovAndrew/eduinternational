ActiveAdmin.register Branch do
  menu parent: 'General'
  permit_params :city, :name, :title, :description, :google_map_latitude, :google_map_longitude, :address, :phone, :email, :opened_at, :cover, :branch_logo, :slider_image, :slider_image1, :video_link
  index do
    selectable_column
    column :name
    column :email
    actions
  end

  filter :name
  filter :created_at
  filter :email
  filter :phone
  filter :branch

  controller do
  def find_resource
    scoped_collection.friendly.find(params[:id])
  end
end


    form do |f|
    f.inputs do
      f.input :city, collection: ['Baku', 'Kiev', 'Lviv', 'Odessa', 'Tbilisi', 'Tirana', 'All']
      f.input :name
      f.input :title
      f.input :description
      f.input :google_map_latitude
      f.input :google_map_longitude
      f.input :address
      f.input :phone
      f.input :email
      f.input :opened_at
      f.input :cover
      f.input :branch_logo
      f.input :slider_image
      f.input :slider_image1
      f.input :video_link
    end
    f.actions
  end
end
