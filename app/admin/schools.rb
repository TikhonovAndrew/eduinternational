ActiveAdmin.register School do
  menu parent: 'Components'
  permit_params :branch, :name, :about, :summary, :cover, :video, :category, :link, :cover, :school_image, :slug, :country, :country_id
  index do
    selectable_column
    column :branch
    column :name
    column :category
    actions
  end

  filter :name
  filter :country
  filter :branch
  filter :category

  controller do
  def find_resource
    scoped_collection.friendly.find(params[:id])
  end

end

    form do |f|
    f.inputs do
      f.input :branch, collection: ['Eduinternational', 'Baku', 'Kiev', 'Lviv', 'Odessa', 'Tbilisi', 'Tirana']
      f.input :name
      f.input :category, collection: ['Secondary Education', 'Higher Education']
      f.input :about
      f.input :summary
      f.input :video
      f.input :link
      f.input :cover
      f.input :school_image
    end
    f.actions
  end
end
