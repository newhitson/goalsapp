require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it 'renders the new user page' do
      get :new

      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    it 'creates a new user' do
      post :create, params: {username: 'Vegeta', password: 'password'}
      expect(response).to redirect_to(goals_url)
    end
  end
end
