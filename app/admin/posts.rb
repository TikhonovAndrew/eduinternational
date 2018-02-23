ActiveAdmin.register Post do
  permit_params :name, :body, :branch, :cover, :post_image
  index do
    selectable_column
    column :branch
    column :name
    column :body, truncate(100)
    column :created_at
    actions
  end

  filter :branch
  filter :name
  filter :body
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
      f.input :body
      f.input :cover
      f.input :post_image
    end
    f.actions
  end
end
