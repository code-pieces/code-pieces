class Snippet < ActiveRecord::Base
  belongs_to :user, foreign_key: :created_by
  belongs_to :language

  validates :name, presence: true
  validates :tag_trigger, presence: true
  validates :contents, presence: true
  validates :created_by, presence: true
  validates :language_id, presence: true
  validates :scope, presence: true

  scope :updated_order, -> () { order(:updated_at).reverse_order }
  before_validation :update_scope

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



  def update_scope
    # binding.pry
    self.scope = "source.#{language.extension}"
    true
  end
end
