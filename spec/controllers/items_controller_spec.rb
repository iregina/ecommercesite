require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
let(:item) { Item.create(title: 'balloon', price: 70.00, description: 'neat', user_id: 4, quantity: 3) }

  # describe "GET #create" do
  #   it "returns http success" do
  #     get :create
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'renders the index' do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    before {@item = item}

    it "returns http success" do
      get :show, id: @item.id
      expect(response).to have_http_status(:success)
    end

    it 'renders the view for showing a product' do
      get :show, id: @item.id
      response.should render_template :show
    end

  end

  # describe "GET #update" do
  #   it "returns http success" do
  #     get :update
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #destroy" do
  #   it "returns http success" do
  #     get :destroy
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
