ActiveAdmin.register Testimonial do
  menu parent: 'Components'
  permit_params :name, :school, :body, :branch_id, :cover, :author_photo, :slug, :category, :surname
  index do
    selectable_column
    column :branch
    column :school
    column :category
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
  filter :surname
  filter :school
  filter :category
  filter :created_at


    form do |f|
    f.inputs do
      f.input :branch
      f.input :category, collection: ['Student', 'Partner']
      f.input :name
      f.input :surname
      f.input :school
      f.input :body
      f.input :cover
      f.input :author_photo
    end
    f.actions
  end
end
