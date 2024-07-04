require 'rails_helper'

RSpec.describe "votes/new", type: :view do
  before(:each) do
    assign(:vote, Vote.new(
      upvote: false,
      downvote: false,
      user: nil,
      votable: nil
    ))
  end

  it "renders new vote form" do
    render

    assert_select "form[action=?][method=?]", votes_path, "post" do

      assert_select "input[name=?]", "vote[upvote]"

      assert_select "input[name=?]", "vote[downvote]"

      assert_select "input[name=?]", "vote[user_id]"

      assert_select "input[name=?]", "vote[votable_id]"
    end
  end
end
