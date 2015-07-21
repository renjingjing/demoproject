ActiveAdmin.register Product do
    index do
        selectable_column
        id_column
        column :title
        column :description
        column :price
        column :sku
        column :quantity
        column :created_at
        column :updated_at
        column :category_id
        column :producer_id
        column :image

        actions
      end

      form do |f|
        f.inputs "Admin Details" do
          f.input :title
          f.input :description
          f.input :price
          f.input :sku
          f.input :quantity
          f.input :created_at
          f.input :updated_at
          f.input :category_id
          f.input :producer_id
          f.input :image

        end
        f.actions
      end

    permit_params do
      [:title,:description,:price,:sku,:quantity,:category_id,:producer_id,:created_at,:updated_at,:image]
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
