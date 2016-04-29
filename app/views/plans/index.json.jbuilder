json.array!(@plans) do |plan|
  json.extract! plan, :id, :title, :start_time, :end_time, :warm_up, :intro, :drill, :practice, :gamesandactivities, :review
  json.url plan_url(plan, format: :json)
end
