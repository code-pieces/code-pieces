class Snippet < ActiveRecord::Base
  belongs_to :user, foreign_key: :created_by

  def as_sublime_snippet
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.snippet {
        xml.name        name
        xml.content     contents
        xml.tabTrigger  tag_trigger
        xml.scope       scope
        xml.description name
      }
    end

    {name: name, contents: builder.to_xml}
  end
end
