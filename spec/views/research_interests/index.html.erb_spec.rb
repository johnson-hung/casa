require 'rails_helper'

RSpec.describe "research_interests/index", type: :view do
  before(:each) do
    assign(:research_interests, [
      ResearchInterest.create!(
        :field => "Field"
      ),
      ResearchInterest.create!(
        :field => "Field"
      )
    ])
  end

  it "renders a list of research_interests" do
    render
    assert_select "tr>td", :text => "Field".to_s, :count => 2
  end
end
