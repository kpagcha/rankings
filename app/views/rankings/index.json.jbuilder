json.array!(@rankings) do |ranking|
  json.extract! ranking, :id, :name, :sport, :year
  json.url ranking_url(ranking, format: :json)
end
