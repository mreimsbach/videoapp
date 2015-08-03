json.array!(@videos) do |video|
  json.extract! video, :id, :name, :description, :file
  json.url video_url(video, format: :json)
end
