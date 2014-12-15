json.array!(@players) do |player|
  json.extract! player, :id, :last_name, :first_name, :country, :points, :week_change, :tournaments_played
  json.url player_url(player, format: :json)
end
