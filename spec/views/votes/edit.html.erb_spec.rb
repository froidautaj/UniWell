require 'rails_helper'

RSpec.describe "votes/edit", type: :view do
  let(:vote) {
    Vote.create!(
      upvote: false,
      downvote: false,
      user: nil,
      votable: nil
    )
  }

  before(:each) do
    assign(:vote, vote)
  end

  it "renders the edit vote form" do
    render

    assert_select "form[action=?][method=?]", vote_path(vote), "post" do

      assert_select "input[name=?]", "vote[upvote]"

      assert_select "input[name=?]", "vote[downvote]"

      assert_select "input[name=?]", "vote[user_id]"

      assert_select "input[name=?]", "vote[votable_id]"
    end
  end
end
