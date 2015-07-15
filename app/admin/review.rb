ActiveAdmin.register Review do
  index do
      selectable_column
      id_column
      column :title
      column :description
      column :price
      column :sku
      column :quantity
      actions
    end

    form do |f|
      f.inputs "Admin Details" do
        f.input :body
        f.input :image
        f.input :user_id
        f.input :category_id
        f.input :producer_id
        f.input :created_at
        f.input :updated_at
      end
      f.actions
    end

  permit_params do
    [:body, :image,:category_id,:producer_id,:created_at,:updated_at]
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
