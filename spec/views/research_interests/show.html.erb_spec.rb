require 'rails_helper'

RSpec.describe "research_interests/show", type: :view do
  before(:each) do
    @research_interest = assign(:research_interest, ResearchInterest.create!(
      :field => "Field"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Field/)
  end
end
