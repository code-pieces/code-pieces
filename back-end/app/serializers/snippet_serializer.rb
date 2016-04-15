class SnippetSerializer < ActiveModel::Serializer
  attributes :id, :name, :contents, :created_by, :scope, :tag_trigger
end
