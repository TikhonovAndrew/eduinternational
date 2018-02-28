ActiveAdmin.register Country do
  menu parent: 'Components'
  permit_params :name, :about, :visa_box, :slug, :video, :country_code, :selective, :country_image, :branch_id, :branch_id
  index do
    selectable_column
    column :name
    column :branch
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
  filter :country_code
  filter :branch
  filter :category

 form do |f|
    f.inputs do
      f.input :branch
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
