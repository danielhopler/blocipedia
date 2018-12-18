require 'rails_helper'

RSpec.describe WikisController, type: :controller do


  let(:my_user) { User.create!(username: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
  let(:my_wiki) { Wiki.create!(title: "New Wiki Title", body: "New Wiki Body", user: my_user) }

  before do
    my_user.confirm
    sign_in my_user
  end


  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns Wiki.all to @wikis" do
      get :index
      expect(assigns(:wikis)).to eq([my_wiki])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

end
