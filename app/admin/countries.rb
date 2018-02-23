ActiveAdmin.register Country do
  permit_params :name, :about, :visa_box, :slug, :video, :country_code, :selective
  index do
    selectable_column
    column :name
    column :country_code
    column :slug
    actions
  end

  filter :name
  filter :country
  filter :branch
  filter :category

end
