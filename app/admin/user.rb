ActiveAdmin.register User do
  index do
      selectable_column
      id_column
      column :first_name
      column :last_name
      column :email
      column :password_digest
      column :address1
      column :address2
      column :image
      column :note
      column :created_at
      column :updated_at
      actions
    end

    form do |f|
      f.inputs "Admin Details" do
        f.input :first_name
        f.input :last_name
        f.input :email
        f.input :password_digest
        f.input :address1
        f.input :address2
        f.input :created_at
        f.input :updated_at
        f.input :image
        f.input :note
      end
      f.actions
    end

  permit_params do
    [:first_name,:last_name,:image,:email,:password_digest,:address1,:address2,:note,:created_at,:updated_at]
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
