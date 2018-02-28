ActiveAdmin.register Post do
  menu parent: 'Components'
  permit_params :name, :title, :body, :branch_id, :cover, :post_image, :slug
  index do
    selectable_column
    column :branch
    column :name
    column :title
    column :created_at
    actions
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  filter :branch
  filter :name
  filter :title
  filter :body
  filter :created_at


    form do |f|
    f.inputs do
      f.input :branch
      f.input :name
      f.input :title
      f.input :body
      f.input :cover
      f.input :post_image
    end
    f.actions
  end
end
