json.array!(@snippets) do |snippet|
  json.extract! snippet, :id, :name, :contents, :created_by, :scope, :tag_trigger
  json.url snippet_url(snippet, format: :json)
end
