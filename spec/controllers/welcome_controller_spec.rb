require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
=begin

  let(:my_user) { User.create!(username: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }

  before do
    sign_in my_user
  end

  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

=end
end
