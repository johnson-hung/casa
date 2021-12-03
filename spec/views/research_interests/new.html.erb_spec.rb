require 'rails_helper'

RSpec.describe "research_interests/new", type: :view do
  before(:each) do
    assign(:research_interest, ResearchInterest.new(
      :field => "MyString"
    ))
  end

  it "renders new research_interest form" do
    render

    assert_select "form[action=?][method=?]", research_interests_path, "post" do

      assert_select "input#research_interest_field[name=?]", "research_interest[field]"
    end
  end
end
