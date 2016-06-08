json.array!(@articals) do |artical|
  json.extract! artical, :id, :title, :description
  json.url artical_url(artical, format: :json)
end
