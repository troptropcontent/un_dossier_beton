require 'rails_helper'

RSpec.describe "Folders", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/folders/index"
      expect(response).to have_http_status(:success)
    end
  end

end
