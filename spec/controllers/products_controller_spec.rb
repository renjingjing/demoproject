require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  # let(:user)     { create(:user) }
  # let(:user_1)   { create(:user) }
  # let(:product) { create(:product, user: user) }

  describe "#index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "instantiates products variable a list of all products in DB" do
      product # this calls the variable in the `let` which creates a product
      product_1 = create(:product)
      get :index
      expect(assigns(:products)).to eq([product, product_1])
    end


    describe "#create" do
      context "with valid parameters" do
        def valid_request
          post :create, { product: {name: 'My product', descriptions: 'This is index descriptions'
          } }
        end
        it "changes the product count by +1" do
          expect{ valid_request }.to change{ Product.count }.by(1)
        end
        it "sets a flash notice message and redirects to the new product show page" do
          valid_request
          expect(response).to redirect_to product_path(Product.last)
        end
      end

      context "with invalid parameters" do
        def invalid_request
            post :create,  { product: {name: '', description: 'This is index descriptions'
               } }
        end
        it "renders the new form" do
          invalid_request
          expect(response).to render_template(:new)
        end

        it "doesn't change the products count" do
          expect {invalid_request}.to_not change { Product.count }
        end

        it "sets a flash alert message" do
          invalid_request
          expect(flash[:alert]).to be
        end
      end
    end
end
