require 'rails_helper'

RSpec.describe "ResearchInterests", type: :request do
  describe "GET /research_interests" do
    it "works! (now write some real specs)" do
      get research_interests_path
      expect(response).to have_http_status(200)
    end
  end
end
