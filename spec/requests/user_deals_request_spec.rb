require 'rails_helper'

RSpec.describe "UserDeals", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/user_deals/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/user_deals/create"
      expect(response).to have_http_status(:success)
    end
  end

end
