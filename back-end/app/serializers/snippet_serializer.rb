class SnippetSerializer < ActiveModel::Serializer
  attributes :id, :name, :contents, :description, :created_by, :scope, :tag_trigger, :created_at, :updated_at
  has_one :user, serializer: SnippetUserSerializer
end
