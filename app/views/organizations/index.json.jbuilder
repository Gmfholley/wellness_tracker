json.array!(@organizations) do |organization|
  json.extract! organization, :id, :name, :first_name, :last_name, :email
  json.url organization_url(organization, format: :json)
end
