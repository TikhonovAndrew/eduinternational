ActiveAdmin.register Event do

  menu parent: 'Components'
  permit_params :branch, :name, :location, :description, :cover, :event_date_time, :event_date_time_end, :slug, :google_map_latitude, :google_map_longitude, :event_image, :event_image1, :subject

  index do
    selectable_column
    column :branch
    column :event_date_time
    column :name
    column :location
    actions
  end

  filter :event_date_time
  filter :name
  filter :branch
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
      f.input :subject
      f.input :location
      f.input :google_map_latitude
      f.input :google_map_longitude
      f.input :description
      f.input :cover
      f.input :event_image
      f.input :event_image1
      f.input :event_date_time , :as => :datepicker
      f.input :event_date_time_end, :as => :datepicker
    end
    f.actions
  end
end
