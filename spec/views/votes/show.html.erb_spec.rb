require 'rails_helper'

RSpec.describe "votes/show", type: :view do
  before(:each) do
    assign(:vote, Vote.create!(
      upvote: false,
      downvote: false,
      user: nil,
      votable: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
