require 'rails_helper'

RSpec.describe "snippets/index", type: :view do
  before(:each) do
    assign(:snippets, [
      Snippet.create!(
        :name => "Name",
        :contents => "MyText",
        :created_by => 1,
        :scope => "Scope",
        :tag_trigger => "Tag Trigger"
      ),
      Snippet.create!(
        :name => "Name",
        :contents => "MyText",
        :created_by => 1,
        :scope => "Scope",
        :tag_trigger => "Tag Trigger"
      )
    ])
  end

  it "renders a list of snippets" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Scope".to_s, :count => 2
    assert_select "tr>td", :text => "Tag Trigger".to_s, :count => 2
  end
end
