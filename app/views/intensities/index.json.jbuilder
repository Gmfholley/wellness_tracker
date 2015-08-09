json.array!(@intensities) do |intensity|
  json.extract! intensity, :id, :name, :point_adjustment
  json.url intensity_url(intensity, format: :json)
end
