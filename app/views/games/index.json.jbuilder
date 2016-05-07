json.array!(@games) do |game|
  json.extract! game, :id, :TeamOne, :TeamTwo, :TeamOneVotes, :TeamTwoVotes
  json.url game_url(game, format: :json)
end
