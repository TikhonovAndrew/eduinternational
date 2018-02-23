ActiveAdmin.register Fair do
  permit_params :branch, :name, :location, :description, :cover, :fair_date_time, :fair_date_time_end, :slug, :google_map_latitude, :google_map_longitude, :fair_image

  index do
    selectable_column
    column :branch
    column :fair_date_time
    column :name
    column :comments
    actions
  end

  filter :fair_date_time
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
      f.input :branch, collection: ['Eduinternational', 'Baku', 'Kiev', 'Lviv', 'Odessa', 'Tbilisi', 'Terana']
      f.input :name
      f.input :location
      f.input :google_map_latitude
      f.input :google_map_longitude
      f.input :description
      f.input :cover
      f.input :fair_image
      f.input :fair_date_time
      f.input :fair_date_time_end
    end
    f.actions
  end
end
