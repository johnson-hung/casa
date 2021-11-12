require 'rails_helper'

RSpec.describe "research_interests/edit", type: :view do
  before(:each) do
    @research_interest = assign(:research_interest, ResearchInterest.create!(
      :field => "MyString"
    ))
  end

  it "renders the edit research_interest form" do
    render

    assert_select "form[action=?][method=?]", research_interest_path(@research_interest), "post" do

      assert_select "input#research_interest_field[name=?]", "research_interest[field]"
    end
  end
end
