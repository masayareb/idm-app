require 'rails_helper'

RSpec.describe "DataExports", type: :request do

  describe "GET /export_csv" do
    it "returns http success" do
      get "/data_exports/export_csv"
      expect(response).to have_http_status(:success)
    end
  end

end
