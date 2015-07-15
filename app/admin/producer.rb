ActiveAdmin.register Producer do
  index do
      selectable_column
      id_column
      column :name
      column :information
      actions
    end

    form do |f|
      f.inputs "Admin Details" do
        f.input :name
        f.input :information
        f.input :created_at
        f.input :updated_at
      end
      f.actions
    end

  permit_params do
    [:name, :information,:created_at,:updated_at]
  end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
