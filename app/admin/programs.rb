ActiveAdmin.register Program do
  menu parent: 'Components'
  permit_params :name, :school_id
  index do
    selectable_column
    column :name
    column :school_id
    actions
  end

  filter :name
  filter :school



    form do |f|
    f.inputs do
      f.input :name
      f.input :school
    end
    f.actions
  end
end
