require 'rails_helper'

RSpec.describe "Dynamics", type: :request do
  describe "GET /dynamics" do
    it "works! (now write some real specs)" do
      get dynamics_path
      expect(response).to have_http_status(200)
    end
  end
end
