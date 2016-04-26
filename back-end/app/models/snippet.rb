class Snippet < ActiveRecord::Base
  belongs_to :user, foreign_key: :created_by
  belongs_to :language

  def as_sublime_snippet
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.snippet {
        xml.name        name
        xml.content     { xml.cdata contents }
        xml.tabTrigger  tag_trigger
        xml.scope       scope
        xml.description name
      }
    end

    {id: id, name: name, contents: builder.to_xml}
  end
end
