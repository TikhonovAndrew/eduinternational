ActiveAdmin.register Country do
  menu parent: 'Components'
  permit_params :name, :about, :visa_box, :slug, :video, :country_code, :selective, :country_image, :branch
  index do
    selectable_column
    column :name
    column :country_code
    column :slug
    actions
  end

  controller do
  def find_resource
    scoped_collection.friendly.find(params[:id])
  end
end

  filter :name
  filter :country
  filter :branch
  filter :category

 form do |f|
    f.inputs do
      f.input :branch, collection: ['Eduinternational', 'Baku', 'Kiev', 'Lviv', 'Odessa', 'Tbilisi', 'Tirana']
      f.input :name
      f.input :about
      f.input :visa_box
      f.input :video
      f.input :country_image
      f.input :country_code
      f.input :selective
    end
    f.actions
  end
end
