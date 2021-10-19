require 'rails_helper'

RSpec.describe "Schema", type: :request do
  describe "GET /openapi.yaml" do
    it "returns http success" do
      get "/openapi.yaml"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /rapidoc.html" do
    it "returns http success" do
      get "/rapidoc.html"
      expect(response).to have_http_status(:success)
    end
  end

end
