require 'rails_helper'

RSpec.describe Admin::ItemsController, type: :controller do

let(:item) { Item.create(title: 'car', price: 2000.00, description: 'lemon', user_id: 2, quantity: 1) }

# log in Admin with this?
# need to redo this?
  before :each do
    user = 'admin'
    pw = 'secret'
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
    @item = item
  end


  describe "POST #create" do
  params = {item: {title: 'bike', price: 2000.00, description: 'lemon', user_id: 2, quantity: 1}}

    it "returns http success" do
      expect{
      post :create, params#= {title: 'bike', price: 2000.00, description: 'lemon', user_id: 2, quantity: 1}
      # p response
      }.to change(Item,:count).by(1)
    end

  #   it 'creates a new item on the server side' do
  # expect{
  #   post :create, item_params = {title: 'bike', price: 2000.00, description: 'lemon', user_id: 2, quantity: 1}
  # }.to change(Item.count).by(1)
# end


  end

  describe "GET #update" do
    it "returns http success" do
      get :update, id: @item.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: @item.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: @item.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: @item.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
