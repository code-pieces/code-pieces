require 'rails_helper'

RSpec.describe "snippets/show", type: :view do
  before(:each) do
    @snippet = assign(:snippet, Snippet.create!(
      :name => "Name",
      :contents => "MyText",
      :created_by => 1,
      :scope => "Scope",
      :tag_trigger => "Tag Trigger"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Scope/)
    expect(rendered).to match(/Tag Trigger/)
  end
end
